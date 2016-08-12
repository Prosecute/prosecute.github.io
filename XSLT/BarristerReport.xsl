<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:pr="http://prosecute.github.io/XMLShema"    
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 10, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> Fry</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <html>
            <head>
                <title>Barrister output</title>
                <link rel="stylesheet" href="css/foundation.css"/>
                <link rel="stylesheet" href="css/app.css" />
            </head>
            <body>
                <div class="row">
                    <div class="large-12 columns">
                        <h1><img src="img/prosecutor.png" width="92"/> Prosecutor</h1>
                        <h3>Barrister report - {filename}</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="large-12 columns">
                        <div class="callout">
                            <div class="row">
                                <div class="large-5 medium-5 small-12 columns">
                                    <div class="row larger-gap">
                                       <div class="small-6 columns secondary-text">
                                           Tool
                                       </div>
                                       <div class="small-6 columns">
                                           <xsl:value-of select="*[local-name()='Report']/@*[local-name()='tool']"/> - <xsl:value-of select="*[local-name()='Report']/@*[local-name()='version']"/>
                                       </div>
                                    </div>
                                    <div class="row larger-gap">
                                        <div class="small-6 columns secondary-text">
                                            Generated
                                        </div>
                                        <div class="small-6 columns">
                                            <xsl:call-template name="formatDate">
                                                <xsl:with-param name="dateTime" select="*[local-name()='Report']/@*[local-name()='generated']" />
                                            </xsl:call-template>  -
                                            <xsl:call-template name="formatTime">
                                                <xsl:with-param name="dateTime" select="*[local-name()='Report']/@*[local-name()='generated']" />
                                            </xsl:call-template>
                                        </div>
                                    </div>
                                    <div class="row larger-gap">
                                        <div class="small-6 columns secondary-text">
                                            Generate time
                                        </div>
                                        <div class="small-6 columns">
                                                <xsl:value-of select="*[local-name()='Report']/@*[local-name()='generateTime']" />s
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="large-7 medium-7 small-12 columns">
                                    <div class="row">
                                        <div class="large-4 medium-6 small-12 columns">
                                            <p class="text-center secondary-text">Tested submissions</p>
                                            <div class="stat text-center">0</div>
                                        </div>
                                        <div class="large-4 medium-6 small-12 columns">
                                            <p class="text-center secondary-text">Matching submissions</p>
                                            <div class="stat text-center">0</div>
                                        </div>
                                        <div class="large-4 medium-6 small-12 columns">
                                            <p class="text-center secondary-text">Errors</p>
                                            <div class="stat text-center">0</div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="large-12 columns">
                <ul class="tabs" data-tabs="data-tabs" id="example-tabs">
                    <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Suspicius matches</a></li>
                    <li class="tabs-title"><a href="#panel2">All matches</a></li>
                    <li class="tabs-title"><a href="#panel3">Trials</a></li>
                    <li class="tabs-title"><a href="#panel4">Tokens</a></li>
                    <li class="tabs-title"><a href="#panel5">Submission sets</a></li>
                    <li class="tabs-title"><a href="#panel6">Console</a></li>
                    <li class="tabs-title"><a href="#panel7">Errors</a></li>
                </ul>
                <div class="tabs-content" data-tabs-content="example-tabs">
                    <div class="tabs-panel is-active" id="panel1">
                        <p>Not implemented.</p>
                    </div>
                    <div class="tabs-panel" id="panel2">
                        <xsl:apply-templates select="*[local-name()='Report']/*[local-name()='Matches']"/>
                    </div>
                    <div class="tabs-panel" id="panel3">
                        <xsl:apply-templates select="*[local-name()='Report']/*[local-name()='Trials']"/>
                    </div>
                    <div class="tabs-panel" id="panel4">
                        <p>Not implemented.</p>
                    </div>
                    <div class="tabs-panel" id="panel5">
                        <p>Not implemented.</p>
                    </div>
                    <div class="tabs-panel" id="panel6">
                        <p>Not implemented.</p>
                    </div>
                    <div class="tabs-panel" id="panel7">
                        <p>No errors found.</p>
                    </div>
                </div>
                    </div>
                </div>
                <div class="row">
                    <div class="">
                    </div>
                </div>
                <script src="js/vendor/jquery.js"></script>
                <script src="js/vendor/what-input.js"></script>
                <script src="js/vendor/foundation.js"></script>
                <script src="js/app.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="*[local-name()='Trials']" >
        <ul class="accordion" data-accordion="data-accordion" data-multi-expand="true" data-allow-all-closed="true">
            <xsl:apply-templates select="*[local-name()='Trial']"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="*[local-name()='Matches']" >
        <ul class="accordion" data-accordion="data-accordion"  data-allow-all-closed="true">
            <xsl:apply-templates select="*[local-name()='Match']"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="*[local-name()='Trial']">
        <li class="accordion-item" data-accordion-item="data-accordion-item">
            <a href="#" class="accordion-title"><span class="secondary-text">[Trial <xsl:value-of select="@*[local-name()='trialID']"/>] </span><span class="primary-text"><xsl:value-of select="@*[local-name()='trialName']"/></span></a>
            <div class="accordion-content" data-tab-content="data-tab-content">
                <div class="large-12 columns">
                    <div class="callout">
                        <div class="row">
                            <div class="large-5 medium-5 small-12 columns">
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Sensitivity
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:value-of select="@*[local-name()='sensitivity']"/>
                                    </div>
                                </div>
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Minimal match
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:value-of select="@*[local-name()='minMatch']"/>
                                    </div>
                                </div>
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Extensions
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:for-each select="*[local-name()='Extensions']/*[local-name()='Extension']">
                                            .<xsl:value-of select="text()"/> 
                                        </xsl:for-each>
                                    </div>
                                </div>
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Basecode location
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:for-each select="*[local-name()='Basecode']/*[local-name()='Location']">
                                            .<xsl:value-of select="text()"/> 
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            <div class="large-7 medium-7 small-12 columns">
                                <div class="row">
                                    <div class="large-6 medium-6 small-6 columns">
                                        <p class="text-center secondary-text">Language</p>
                                        <div class="stat text-center"><xsl:value-of select="*[local-name()='Language']/@*[local-name()='name']"/></div>
                                    </div>
                                    <div class="large-6 medium-6 small-6 columns">
                                        <p class="text-center secondary-text">Version</p>
                                        <div class="stat text-center"><xsl:value-of select="*[local-name()='Language']/@*[local-name()='version']"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </xsl:template>
    <xsl:template match="*[local-name()='Match']" >
        <li class="accordion-item" data-accordion-item="data-accordion-item">
            <a href="#" class="accordion-title"><span class="secondary-text">[Submission set <xsl:value-of select="@*[local-name()='refEntitiesLocationAID']"/>] </span><span class="primary-text"><xsl:value-of select="@*[local-name()='refNameA']"/></span> --- <xsl:value-of select="@*[local-name()='match']"/>% --- <span class="secondary-text">[Submission set <xsl:value-of select="@*[local-name()='refEntitiesLocationBID']"/>] </span><span class="primary-text"><xsl:value-of select="@*[local-name()='refNameB']"/></span></a>
            <div class="accordion-content" data-tab-content="data-tab-content">
                <div class="large-12 columns">
                    <div class="callout">
                        <div class="row">
                            <div class="large-5 medium-5 small-12 columns">
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Sensitivity
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:value-of select="@*[local-name()='sensitivity']"/>
                                    </div>
                                </div>
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Minimal match
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:value-of select="@*[local-name()='minMatch']"/>
                                    </div>
                                </div>
                                <div class="row larger-gap">
                                    <div class="small-6 columns secondary-text">
                                        Extensions
                                    </div>
                                    <div class="small-6 columns">
                                        <xsl:for-each select="*[local-name()='Extensions']/*[local-name()='Extension']">
                                            .<xsl:value-of select="text()"/> 
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </div>
                            <div class="large-7 medium-7 small-12 columns">
                                <div class="row">
                                    <div class="large-6 medium-6 small-6 columns">
                                        <p class="text-center secondary-text">Language</p>
                                        <div class="stat text-center"><xsl:value-of select="*[local-name()='Language']/@*[local-name()='name']"/></div>
                                    </div>
                                    <div class="large-6 medium-6 small-6 columns">
                                        <p class="text-center secondary-text">Version</p>
                                        <div class="stat text-center"><xsl:value-of select="*[local-name()='Language']/@*[local-name()='version']"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:variable name="pos" select="position()"/>
                    <xsl:for-each select="*[local-name()='TrialMatches']/*[local-name()='TrialMatch']">
                    <div class="callout">
                        <div class="row">
                            
                            <div class="large-12 columns"><h4>Trial <xsl:value-of select="@*[local-name()='trialID']"/> - <xsl:value-of select="/*[local-name()='Report']/*[local-name()='Trials']/*[local-name()='Trial' and @*[local-name()='trialID']=current()/@*[local-name()='trialID']]/@*[local-name()='trialName']"></xsl:value-of></h4>
                            </div>
                        </div>
                    <div class="row">
                        <div class="large-12 columns">
                            <ul class="tabs" data-tabs="data-tabs" id="example-tabs">
                                <li class="tabs-title is-active"><a href="#p{$pos}t{@*[local-name()='trialID']}p1" aria-selected="true">Matching tokens</a></li>
                                <li class="tabs-title"><a href="#p{$pos}t{@*[local-name()='trialID']}p2">Console</a></li>
                                <li class="tabs-title"><a href="#p{$pos}t{@*[local-name()='trialID']}p3">Errors</a></li>
                            </ul>
                            <div class="tabs-content" data-tabs-content="example-tabs">
                                <div class="tabs-panel is-active" id="p{$pos}t{@*[local-name()='trialID']}p1">
                                    <p>Not implemented.</p>
                                </div>
                                <div class="tabs-panel" id="p{$pos}t{@*[local-name()='trialID']}p2">
                                    <xsl:apply-templates select="*[local-name()='Report']/*[local-name()='Matches']"/>
                                </div>
                                <div class="tabs-panel" id="p{$pos}t{@*[local-name()='trialID']}p3">
                                    <xsl:apply-templates select="*[local-name()='Report']/*[local-name()='Matches']"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </xsl:for-each>
                </div>
            </div>
        </li>
    </xsl:template>
    <xsl:template name="formatDate">
        <xsl:param name="dateTime" />
        <xsl:variable name="date" select="substring-before($dateTime, 'T')" />
        <xsl:variable name="year" select="substring-before($date, '-')" />
        <xsl:variable name="month" select="substring-before(substring-after($date, '-'), '-')" />
        <xsl:variable name="day" select="substring-after(substring-after($date, '-'), '-')" />
        <xsl:value-of select="concat($day, '.', $month, '.', $year)" />
    </xsl:template>
    
    <xsl:template name="formatTime">
        <xsl:param name="dateTime" />
        <xsl:value-of select="substring-after($dateTime, 'T')" />
    </xsl:template>
    
</xsl:stylesheet>