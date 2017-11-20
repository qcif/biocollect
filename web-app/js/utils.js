
/**
 * Check if the browser is a mobile app
 *
 * @returns {boolean}
 */

var utils =utils || {};

utils.detectmob = function()
    {
       if (navigator.userAgent.match(/Android|webOS|iPhone|iPad|BlackBerry|Windows Phone/i)){
           return true;
       }else
           return false;
    };


