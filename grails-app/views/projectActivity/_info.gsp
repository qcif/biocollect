<div id="pActivityInfo" class="well">

        <!-- ko foreach: projectActivities -->
            <!-- ko if: current -->
            <div class="row-fluid">
                <div class="span10">
                    <h2 class="strong">Step 1 of 7 - Describe the survey</h2>
                </div>
                <div class="span2 text-right">
                    <g:render template="../projectActivity/status"/>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="name"><g:message code="project.survey.info.name"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.name"/>', content:'<g:message code="project.survey.info.name.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="req-field"></span></label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <input id="name" type="text" data-bind="valueUpdate: 'input',value: name" data-validation-engine="validate[required]">
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="description"><g:message code="project.survey.info.description"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.description"/>', content:'<g:message code="project.survey.info.description.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="req-field"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <textarea id="description" style="width: 97%;" rows="4" class="input-xlarge" data-bind="value: description"
                                  data-validation-engine="validate[required]"></textarea>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="attribution"><g:message code="project.survey.info.attribution"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.attribution"/>', content:'<g:message code="project.survey.info.attribution.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="req-field"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <textarea id="attribution" rows="4" class="input-xlarge" data-bind="value: attribution"
                                  data-validation-engine="validate[required]"></textarea>
                    </div>
                </div>
            </div>


            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="methodName"><g:message code="project.survey.info.methodName"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.methodName"/>', content:'<g:message code="project.survey.info.methodName.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <input id="methodName" type="text" data-bind="value: methodName">
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="methodAbstract"><g:message code="project.survey.info.methodAbstract"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.methodAbstract"/>', content:'<g:message code="project.survey.info.methodAbstract.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <textarea id="methodAbstract" rows="4" class="input-xlarge" data-bind="value: methodAbstract"></textarea>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="startDate"> <g:message code="project.survey.info.startDate"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.startDate"/>', content:'<g:message code="project.survey.info.startDate.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="req-field"></span></label>
                </div>

                <div class="span8">
                    <div class="controls input-append">
                        <input id="startDate" data-bind="datepicker:startDate.date" type="text"  data-validation-engine="validate[required]" />
                        <span class="add-on  open-datepicker"><i class="icon-calendar"></i> </span>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="endDate"><g:message code="project.survey.info.endDate"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.endDate"/>', content:'<g:message code="project.survey.info.endDate.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls input-append">
                        <input id="endDate" data-bind="datepicker:endDate.date" type="text"/>
                        <span class="add-on open-datepicker"><i class="icon-calendar"></i> </span>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="publicAccess"><g:message code="project.survey.info.publicData"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.publicData"/>', content:'<g:message code="project.survey.info.publicData.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <input id="publicAccess" type="checkbox" data-bind="checked: publicAccess"/>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label" for="allowComments"><g:message code="project.survey.info.comments"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.comments"/>', content:'<g:message code="project.survey.info.comments.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span8">
                    <div class="controls">
                        <input id="allowComments" type="checkbox" data-bind="checked: commentsAllowed"/>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span4 text-right">
                    <label class="control-label"><g:message code="project.survey.info.logo"/>
                        <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.logo"/>', content:'<g:message code="project.survey.info.logo.content"/>'}">
                            <i class="icon-question-sign"></i>
                        </a>
                        <span class="right-padding"></span>
                    </label>
                </div>

                <div class="span2 text-left">
                    <img  alt="No image" data-bind="attr:{src: transients.logoUrl()}">
                    </br>
                    <span class="btn fileinput-button pull-left"
                          data-bind="
                            attr:{'data-role':'logo',
                                'data-url': transients.imageUploadUrl(),
                                'data-owner-type': 'projectActivityId',
                                'data-owner-id': projectActivityId()},
                                 stagedImageUpload: documents,
                                     visible:!logoUrl()">
                            <i class="icon-plus"></i>
                            <input id="logo" type="file" name="files">
                            <span>Attach</span></span>
                    <button class="btn btn-small" data-bind="click:removeLogoImage, visible:logoUrl()"><i class="icon-minus"></i> Remove</button>
                </div>
            </div>

            <g:render template="../projectActivity/indexingNote"/>

    <!-- /ko -->
<!-- /ko -->
</div>

<div id="pSupplementaryActivitySurvey" class="well">

    <div class="row-fluid">
        <div class="span10">
            <h2 class="strong">Supplementary Data</h2>
        </div>
    </div>

    <div class="row-fluid">

        <!-- ko foreach: projectActivities -->
        <!-- ko if: current -->

        <div class="span8 text-left">
            <label class="control-label"><g:message code="project.survey.info.relatedDatasets"/>
                <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.relatedDatasets"/>', content:'<g:message code="project.survey.info.relatedDatasets.content"/>'}">
                    <i class="icon-question-sign"></i>
                </a>

            </label>

            <div class="panel panel-default" >
                <div class="panel-body" style="max-height: 355px; max-width: 500px; overflow-y: scroll; overflow-x: scroll; background:#ffffff;">

                    <!-- ko foreach: $parent.projectActivities -->

                    <!-- ko if: $parent.projectActivityId != projectActivityId -->
                    <input type="checkbox" data-bind="checkedValue: projectActivityId, checked: $parent.relatedDatasets" />

                    <span data-bind="text: name"></span>

                    </br>

                    <!-- /ko -->

                    <!-- /ko -->

                </div>
            </div>

        </div>

        <div class="row-fluid">
            <div class="span4 text-left">
                <label class="control-label" for="usageGuide"><g:message code="project.survey.info.usageGuide"/>
                    <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.usageGuide"/>', content:'<g:message code="project.survey.info.usageGuide.content"/>'}">
                        <i class="icon-question-sign"></i>
                    </a>

                </label>
                <div class="controls">
                    <textarea id="usageGuide" rows="4" class="input-xlarge" data-bind="value: usageGuide"></textarea>
                </div>

                <span class="right-padding"></span>

                <label class="control-label" for="lastUpdated"><g:message code="project.survey.info.lastUpdated"/>
                    <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.lastUpdated"/>', content:'<g:message code="project.survey.info.lastUpdated.content"/>'}">
                        <i class="icon-question-sign"></i>
                    </a>
                </label>
                <div class="controls">
                    <div class="controls input-append">
                        <input id="lastUpdated" data-bind="datepicker:lastUpdated.date" type="text"/>
                        <span class="add-on open-datepicker"><i class="icon-calendar"></i> </span>
                    </div>
                </div>

                <span class="right-padding"></span>

                <label class="control-label" for="legalCustodian"><g:message code="project.survey.info.legalCustodian"/>
                    <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.legalCustodian"/>', content:'<g:message code="project.survey.info.legalCustodian.content"/>'}">
                        <i class="icon-question-sign"></i>
                    </a>
                    <span class="right-padding"></span>
                </label>
                <div class="controls">
                    <div class="survey-editable-dropdown">

                        <input id="legalCustodian" type="text" data-bind="value: legalCustodian" >

                        <select id="selectOption" data-bind="options: transients.custodianOptions,
                                                             value: transients.selectedCustodianOption,
                                                             optionsCaption: 'Enter the custodian'",
                                onChange="$('#legalCustodian').val(this.value);
                                          $('#legalCustodian').trigger('change');
                                          $('#legalCustodian').focus();">
                        </select>
                    </div>

                </div>

                <span class="right-padding"></span>

                <label class="control-label" for="dataSharingLicense"><g:message code="project.survey.info.dataSharingLicense"/>
                    <a href="#" class="helphover" data-bind="popover: {title:'<g:message code="project.survey.info.dataSharingLicense"/>', content:'<g:message code="project.survey.info.dataSharingLicense.content"/>'}">
                        <i class="icon-question-sign"></i>
                    </a>
                    <span class="req-field"></span>
                </label>
                <div class="controls">
                    <input id="dataSharingLicense" type="text" data-bind="value: dataSharingLicense" data-validation-engine="validate[required]">
                </div>
            </div>

        </div>

        <!-- /ko -->
        <!-- /ko -->


    </div>

</div>

<div class="row-fluid">
    <div class="span12">
        <div class="alert alert-info" data-bind="visible: !isSurveyInfoFormFilled()">Enable Next button by filling all mandatory fields on this page.</div>
        <button class="btn-primary btn btn-small block" data-bind="disable: !isSurveyInfoFormFilled(), click: saveInfo"><i class="icon-white  icon-hdd" ></i>  Save </button>
        <button class="btn-primary btn btn-small block" data-bind="disable: !isSurveyInfoFormFilled(), showTabOrRedirect: {url:'', tabId: '#survey-visibility-tab'}">Next <i class="icon-white icon-chevron-right" ></i></button>
    </div>
</div>