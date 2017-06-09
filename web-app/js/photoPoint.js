/*
 * Classes that support the photo point survey data type
 */


var PhotoPointViewModel = function(site, activity) {

    var self = this;

    self.site = site;
    self.photoPoints = ko.observableArray();

    if (site && site.poi) {

        $.each(site.poi, function(index, obj) {
            var photos = ko.utils.arrayFilter(activity.documents, function(doc) {
                return doc.siteId === site.siteId && doc.poiId === obj.poiId;
            });
            self.photoPoints.push(PhotoPoint(site, obj, activity.activityId, photos));
        });
    }

    self.removePhotoPoint = function(photoPoint) {
        self.photoPoints.remove(photoPoint);
    }

    self.addPhotoPoint = function() {
        self.photoPoints.push(PhotoPoint(site, null, activity.activityId, []));
    };

    self.modelForSaving = function() {
        var siteId = site?site.siteId:''
        var toSave = {siteId:siteId, photos:[], photoPoints:[]};

        $.each(self.photoPoints(), function(i, photoPoint) {

            if (photoPoint.isNew()) {
                var newPhotoPoint = photoPoint.photoPoint.modelForSaving();
                toSave.photoPoints.push(newPhotoPoint);
                $.each(photoPoint.photos(), function(i, photo) {
                    if (!newPhotoPoint.photos) {
                        newPhotoPoint.photos = [];
                    }
                    newPhotoPoint.photos.push(photo.modelForSaving());
                });
            }
            else {
                $.each(photoPoint.photos(), function(i, photo) {
                    toSave.photos.push(photo.modelForSaving());
                });
            }

        });
        return toSave;
    };

    self.isDirty = function() {
        var isDirty = false;
        $.each(self.photoPoints(), function(i, photoPoint) {
            isDirty = isDirty || photoPoint.isDirty();
        });
        return isDirty;
    };

    self.reset = function() {};


};

var PhotoPointMetadata = function(data) {
    if (!data) {
        data = {
            geometry:{}
        };
    }
    var name = ko.observable(data.name);
    var description = ko.observable(data.description);
    var lat = ko.observable(data.geometry.decimalLatitude);
    var lng = ko.observable(data.geometry.decimalLongitude);
    var bearing = ko.observable(data.geometry.bearing);


    return {
        poiId:data.poiId,
        name:name,
        description:description,
        geometry:{
            type:'Point',
            decimalLatitude:lat,
            decimalLongitude:lng,
            bearing:bearing,
            coordinates:[lng, lat]
        },
        type:'photopoint',
        modelForSaving:function() { return ko.toJS(this); }
    }
};

/**
 * A Photo point location or just a photo point
 * @param site
 * @param photoPoint
 * @param activityId
 * @param existingPhotos
 * @returns {{photoPoint: {poiId, name, description, geometry, type, modelForSaving}, photos, files, uploadConfig: {url: *, target}, removePhoto: removePhoto, template: template, isNew: isNew, isDirty: isDirty}}
 * @constructor
 */
var PhotoPoint = function(site, photoPoint, activityId, existingPhotos) {

    var files = ko.observableArray();
    var photos = ko.observableArray();
    var isNewPhotopoint = !photoPoint;
    var isDirty = isNewPhotopoint;

    var photoPoint = PhotoPointMetadata(photoPoint);

    $.each(existingPhotos, function(i, photo) {
        photos.push(Photo(photo));
    });


    files.subscribe(function(newValue) {
        var f = newValue.splice(0, newValue.length);
        for (var i=0; i < f.length; i++) {
            var data = {
                thumbnailUrl:f[i].thumbnailUrl,
                url:f[i].url,
                contentType:f[i].contentType(),
                filename:f[i].filename,
                filesize:f[i].filesize,
                dateTaken:f[i].isoDate,
                lat:f[i].decimalLatitude,
                lng:f[i].decimalLongitude,
                poiId:photoPoint.poiId,
                siteId:site.siteId,
                activityId:activityId,
                name:site.name+' - '+photoPoint.name(),
                type:'image'

            };
            isDirty = true;
            if (isNewPhotopoint && data.lat && data.lng && !photoPoint.geometry.decimalLatitude() && !photoPoint.geometry.decimalLongitude()) {
                photoPoint.geometry.decimalLatitude(data.lat);
                photoPoint.geometry.decimalLongitude(data.lng);
            }

            photos.push(Photo(data));
        }
    });


    return {
        photoPoint:photoPoint,
        photos:photos,
        files:files,

        uploadConfig : {
            url: fcConfig.uploadImagesUrl,
            target: files
        },
        removePhoto : function (photo) {
            if (photo.documentId) {
                photo.status('deleted');
            }
            else {
                photos.remove(photo);
            }
        },
        template : function(photoPoint) {
            return isNewPhotopoint ? 'editablePhotoPoint' : 'readOnlyPhotoPoint'
        },
        isNew : function() { return isNewPhotopoint },
        isDirty: function() {
            if (isDirty) {
                return true;
            };
            var tmpPhotos = photos();
            for (var i=0; i < tmpPhotos.length; i++) {
                if (tmpPhotos[i].dirtyFlag.isDirty()) {
                    return true;
                }
            }
            return false;
        }

    }
}

/**
 * Photo metadata for a photo part of a Photo point location
 * @param data
 * @returns {DocumentViewModel}
 * @constructor
 */
var Photo = function(data) {
    if (!data) {
        data = {};
    }
    data.role = 'photoPoint';
    var result = new DocumentViewModel(data);
    result.dateTaken = ko.observable(data.dateTaken).extend({simpleDate:false});
    result.formattedSize = formatBytes(data.filesize);

    for (var prop in data) {
        if (!result.hasOwnProperty(prop)) {
            result[prop]= data[prop];
        }
    }
    var docModelForSaving = result.modelForSaving;
    result.modelForSaving = function() {
        var js = docModelForSaving();
        delete js.lat;
        delete js.lng;
        delete js.thumbnailUrl;
        delete js.formattedSize;

        return js;
    };
    result.dirtyFlag = ko.dirtyFlag(result, false);

    return result;
};
