<%@ page import="groovy.time.TimeCategory" %>
<div id="pActivityVisibility" class="well">

        <!-- ko foreach: projectActivities -->
            <!-- ko if: current -->
                <g:render template="/projectActivity/warning"/>
                <div class="row-fluid">
                    <div class="span10 text-left">
                        <h2 class="strong">Step 2 of 7 - Set visibility constraints on survey data</h2>
                    </div>
                    <div class="span2 text-right">
                        <g:render template="../projectActivity/status"/>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12 text-left">
                        <p>Setting visibility constraints will withhold data from public view for the specified period. These can be changed,
                        but once data has been published to the public domain it cannot be withdrawn via this tool.
                        Please contact <a href="mailto:support@ala.org.au?subject=BioCollect enquiry - data">support@ala.org.au</a> if you have further questions.</p>
                    </div>
                </div>

                <div class="row-fluid">
                   <div class="span12 text-left">
                        <label><input type="radio" value="NONE" data-bind="checked: visibility.embargoOption" name="embargoOptionNone" /> Records publicly visible on submission</label>
                        <label>
                            <input type="radio" value="DAYS" data-bind="checked: visibility.embargoOption" name="embargoOptionDays" /> Records publicly visible after
                            <input class="input-small" data-bind="value:visibility.embargoForDays" data-validation-engine="validate[custom[number],min[1],max[180]]" type="number" min="1" max="180"> days. Choose between 1 and 180.
                        </label>
                        <label class="inline">
                            <input type="radio" value="DATE" data-bind="checked: visibility.embargoOption" name="embargoOptionDate" id="embargoOptionDate" /> Embargo publishing all records until
                            <span class="input-append">
                                <input name="embargoUntilDate" id="embargoUntilDate" data-bind="datepicker: visibility.embargoUntil.date, datePickerOptions: {endDate: '+12m', startDate: '+1d'}, disable: transients.disableEmbargoUntil" data-validation-engine="validate[funcCall[isEmbargoDateRequired]]" type="text"/><span class="add-on open-datepicker"><i class="icon-calendar"></i> </span>
                            </span>
                        </label>
                   </div>


                </div>

                <g:if test="${fc.userIsAlaOrFcAdmin()}">
                    <hr>
                    <h4>ALA ADMIN Only: </h4>
                    <input type="checkbox" data-bind="checked: visibility.alaAdminEnforcedEmbargo"/> <g:message code="project.survey.visibility.adminEmbargo"/>
                    <hr>
                </g:if>
                <!-- ko if: visibility.alaAdminEnforcedEmbargo() -->
                    <span class="text-muted"><g:message code="project.survey.visibility.adminEmbargo.important"/><a href='${grailsApplication.config.biocollect.support.email.address}'>${grailsApplication.config.biocollect.support.email.address}</a></span>
                <!-- /ko -->
                <g:render template="../projectActivity/indexingNote"/>
            <!-- /ko -->
        <!-- /ko -->
</div>

<div class="row-fluid">
    <div class="span12">
        <button class="btn-primary btn btn-small block" data-bind="click: saveVisibility"><i class="icon-white  icon-hdd" ></i> Save </button>
        <button class="btn-primary btn btn-small block" data-bind="showTabOrRedirect: {url:'', tabId: '#survey-info-tab'}"><i class="icon-white icon-chevron-left" ></i>Back</button>
        <button class="btn-primary btn btn-small block" data-bind="showTabOrRedirect: {url:'', tabId: '#survey-alert-tab'}">Next <i class="icon-white icon-chevron-right" ></i></button>
    </div>
</div>


