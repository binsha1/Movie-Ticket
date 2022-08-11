<cfinclude  template="user_header.cfm">
<cfparam  name="seat_num" default="0">
<cfparam  name="show_id" default="0">
<cfparam  name="date" default="#dateFormat(now(),'yyyy-mm-dd')#">
<cfset pdate=toString(toBinary(date))>
<cfset showId=toString(toBinary(show_id))>
<cfset seat_s=toString(toBinary(seat_num))>
<cfset show_res=application.show.getShowDetails(showId)>
<!-- Main content -->
        <div class="place-form-area">
        <section class="container">
        <cfoutput >
        <input type="hidden" name="shId"  id="shIdVal" value="#showId#">       
        <cfloop array="#show_res#" index="i">
            <div class="order-container">
                <div class="order pt-3">
                
                    <img class="order__images" alt='' src="uploads/#i.poster#">
                    <p class="order__title text-center text-white">#i.movie_name# <br>
                    <span class="order__descript">#i.theatre_name#| #i.language# -#i.movie_format#</span></p>
                     
                </div>
            </div>

            <div class="dt_div mt-5">
                <div class="container p-4">
                    <a href="book-ticket.cfm?id=#show_id#&mid=#toBase64(i.m_id)#&date=#date#" class="btn btn-showing" >Back</a>
                    <div class="show_right">
                        <button class="btn btn-showing">#dateformat(pdate,"full")#</button>
                        <button class="btn btn-showing">#timeFormat(i.start_time)# (#i.show_name#)</button>
                    </div>
                </div>
            </div>
                <div class="order-step-area pt-3 text-center">
                   <!---- <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>--->
                    <div class="order-step second--step text-white text-center">Please Choose <cfoutput>#seat_s#
                     seat Now</div>                    
                    <input type="hidden" name="tseats"  id="tseat" value="#seat_s#">       
                    </cfoutput>  
                </div>
            
            <div class="choose-sits text-white">
                <div class="choose-sits__info choose-sits__info--first">
                    <ul>
                        <li class="sits-price marker--none"><strong>Price</strong></li>
                        <li class="sits-price sits-price--cheap">#i.silver_rate#</li>
                        <li class="sits-price sits-price--middle">#i.gold_rate#</li>
                        
                    </ul>
                </div>

                <cfset row=Int(Sqr(i.total_seats))>
                <cfset columns=Int(ceiling(i.total_seats/(row)))>
                
                
                <div class="choose-sits__info">
                    <ul>
                        <li class="sits-state sits-state--not">Not available</li>
                        <li class="sits-state sits-state--your"></li>
                    </ul>
                </div>
                
                <div class="col-sm-12 col-lg-10 col-lg-offset-1">
                <div class="sits">
                <!---
                <aside class="sits__checked">
                            <div class="checked-place">
                                
                            </div>
                            <div class="checked-result">
                                $0
                            </div>
                        </aside>--->
                </div>
                <div class="sits-area hidden-xs">
                    <div class="sits-anchor">screen</div>
                    
                    <div class="sits">
                        <cfoutput>
                            <cfloop from="1" to="#columns#" index="k" step="1">
                            <span class="sits__indecator">
                            #k#</span></cfloop>
                            </cfoutput>
                    </div>
                    <h6 class="pt-3">SILVER PLUS</h6>
                    <div class="sits">
                    
                        <aside class="sits__line text-white">
                            <cfset charArray=arrayNew(1)>
                            <cfset alphabets=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z' ]>
                            <cfoutput>
                            <cfloop index="j" from="1" to="#Round(row/2)#" step="1">
                                <span class="sits__indecator"> #alphabets[j]# </span>
                            </cfloop>
                            <div class="pt-3">
                             <cfloop index="j" from=#Round(row/2)+1# to=#row# step="1">
                                <span class="sits__indecator"> #alphabets[j]# </span>
                                </cfloop>
                            </div>
                            </cfoutput>
                            
                        </aside>
                        <cfoutput>
                            <cfloop index="j" from="1" to=#Round(row/2)# step="1">
                                <div class="sits__row">
                                    <cfloop index="k" from="1" to="#columns#" step="1">
                                        <span class="sits__place sits-price--cheap" data-place='#alphabets[j]&k#' data-price=#i.silver_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                </div>
                            </cfloop>
                            <h6>GOLD PLUS</h6>
                            <div class="">
                            
                            <cfloop index="j" from=#Round(row/2)+1# to=#row-1# step="1">
                                <div class="sits__row">
                                    <cfset n=(row*columns)-i.total_seats>
                                    <cfloop index="k" from="1" to="#columns#" step="1">
                                        <span class="sits__place sits-price--middle " data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                </div>
                            </cfloop>
                            <cfloop index="j" from=#row# to=#row# step="1">
                                <div class="sits__row">
                                    <cfset n=(row*columns)-i.total_seats>
                                    <cfloop index="k" from="1" to="#columns-n#" step="1">
                                        <span class="sits__place sits-price--middle " data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                   <cfloop index="k" from="#(columns-n)+1#" to="#columns#" step="1">
                                        <span class="sits__place sits-price--middle sits-state--not" data-place='#alphabets[j]&k#' data-price=#i.gold_rate#>#alphabets[j]&k#</span>
                                   </cfloop>
                                   
                                </div>
                            </cfloop>
                        </div>
                        </cfoutput>
                        </cfloop>
                </cfoutput>
                            
                        <!---
                        <footer class="sits__number">
                        <cfoutput>
                            <cfloop from="1" to="#columns#" index="i" step="1">
                            <span class="sits__indecator">
                            #i#</span></cfloop>
                            </cfoutput>
                            
                        </footer>--->
                        
                    </div>
                </div>
            </div>
                
            <div class="col-sm-12 visible-xs"> 
                <div class="sits-area--mobile">
                    <div class="sits-area--mobile-wrap">
                        <!---
                        <div class="sits-select">
                            <select name="sorting_item" class="sits__sort sit-row" tabindex="0">
                                    <option value="1" selected='selected'>A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                    <option value="5">E</option>
                                    <option value="6">F</option>
                                    <option value="7">G</option>
                                    <option value="8">I</option>
                                    <option value="9">J</option>
                                    <option value="10">K</option>
                                    <option value="11">L</option>
                            </select>
 
                            <select name="sorting_item" class="sits__sort sit-number" tabindex="1">
                                    <option value="1" selected='selected'>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                            </select>

                            <a href="#" class="btn btn-md btn--warning toogle-sits">Choose sit</a>
                        </div>
                    </div>

                    <a href="#" class="watchlist add-sits-line">Add new sit</a>---> 

                    <aside class="sits__checked">
                            <div class="checked-place">
                                <span class="choosen-place"></span>
                            </div>
                            <div class="checked-result">
                                $0
                            </div>
                    </aside>

                    <img alt="" src="images/components/sits_mobile.png">
                    <div class="text-center pb-3 pt-3">
                    <button type="button" class="btn btn-showing confirm " data-bs-toggle="modal"  data-bs-target=".confirmModal"  >Confirm Selection</button>
                    </div>
                </div>
            </div>  
                
            </div>
                

            </div>
            
        </section>
        </div>
        <cfinclude  template="modals/confirm.cfm">
        <cfinclude  template="user_footer.cfm">