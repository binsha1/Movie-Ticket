<cfcomponent>
    <cffunction name="doLogin" access="remote" output="true" >
        <cfargument  name="user_name" type="string" required="true">
        <cfargument  name="pwd" type="string" required="true">        
        <cfset local.password=hash(arguments.pwd,'sha') >       
        <cfquery name="loginUser" datasource="movie_ticket" result="log_res">
            SELECT * FROM movie_ticket.login 
            WHERE user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">
            AND password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>        
        <cfif log_res.recordCount EQ 1>                      
            <cfset session.sessionUser={'user_id'=loginUser.id,'user_name'=loginUser.user_name}>           
            <cfif loginUser.role=='admin'>
                <cflocation  url="../admin/dashboard.cfm" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('1','sha')>
            <cflocation  url="../admin/index.cfm?status=#local.status#" addtoken="no">            
        </cfif>   
    </cffunction>

    <cffunction name="doAdminLogout" access="remote" output="false">
        <cfset structDelete(session, "sessionUser")>
        <cflocation url="../admin/index.cfm" addtoken="no">
    </cffunction>

    <cffunction name="userLogout" access="remote" output="false">
        <cfset structDelete(session, "userLog")>
        <cflocation url="../index.cfm" addtoken="no">
    </cffunction>

    <cffunction name="updatePass" access="remote" output="true">
        <cfargument  name="old_pass" type="string">
        <cfargument  name="new_pass" type="string">
        <cfargument  name="c_pass" type="string">
        <cfset local.pass=hash(arguments.new_pass,'sha')>
        <cfif arguments.old_pass!="" && arguments.new_pass!="" && arguments.c_pass!="">
            <cfif arguments.new_pass==arguments.c_pass> 
                <cfquery name="update_pass" result="pass_res">
                    UPDATE movie_ticket.login SET 
                    password=<cfqueryparam value="#local.pass#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE role="admin"
                </cfquery>
                <cfif pass_res.RecordCount NEQ 0>
                    <cfset local.status=hash('1','sha')>
                </cfif>
            <cfelse>
                <cfset local.status=hash('3','sha')>
                <cflocation  url="../admin/update_password.cfm?status=#local.status#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cflocation  url="../admin/update_password.cfm?status=#local.status#" addtoken="no">
    </cffunction>

    <cffunction name="updateUserPassword" access="remote" output="true">
        <cfargument  name="email_id" type="string">
        <cfargument  name="pass" type="string">
        <cfargument  name="cpass" type="string">
        <cfset local.pwd=hash(arguments.pass,'sha')>
        <cfquery name="email_exists" result="email_res">
                SELECT email_id FROM movie_ticket.login 
                WHERE email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif arguments.email_id!="" && arguments.pass!="" && arguments.cpass!="">
            <cfif arguments.pass EQ arguments.pass>
                <cfif email_res.RecordCount EQ 1 >
                    <cfquery name="update_pass" result="pass_res">
                        UPDATE movie_ticket.login SET 
                        password=<cfqueryparam value="#local.pwd#" cfsqltype="CF_SQL_VARCHAR">
                        WHERE email_id=<cfqueryparam value="#arguments.email_id#" cfsqltype="CF_SQL_VARCHAR">
                    </cfquery>
                    <cfif pass_res.RecordCount NEQ 0>
                        <cfset local.status=hash('4','sha')>
                        <cflocation  url="../login.cfm?status=#local.status#" addtoken="no">
                    </cfif>
                <cfelse>
                    <cfset local.status=hash('1','sha')>  
                </cfif>                  
            <cfelse>
                <cfset local.status=hash('3','sha')>
            </cfif>
        <cfelse>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cflocation  url="../forgot_password.cfm?status=#local.status#" addtoken="no">
    </cffunction>


    <cffunction name="userSignUp" access="remote">

        <cfargument  name="full_name" type="string">
        <cfargument  name="email" type="string">        
        <cfargument  name="pass" type="string">
        <cfset local.password = hash(arguments.pass,'sha')>   
        <cfquery name="address_email" result="email_res">
            SELECT * FROM movie_ticket.login
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>       
        <cfif email_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif>        
        <cfif arguments.full_name!="" && arguments.email!="" && arguments.pass!="" >
            <cfif email_res.RecordCount EQ 0  >
                <cfquery name="signup" result="result">
                    INSERT INTO movie_ticket.login(
                        user_name,
                        password,
                        role,
                        email_id,
                        registered_on,
                        reg_time) 
                    VALUES(
                        <cfqueryparam value="#arguments.full_name#" cfsqltype="CF_SQL_VARCHAR">,                        
                        <cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="user" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR"> ,  
                        <cfqueryparam value="#dateformat(now(),"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE"> , 
                        <cfqueryparam value="#timeformat(now(),"HH:n:ss")#" cfsqltype="CF_SQL_TIME">                
                        )
                </cfquery>
                <cfif result.RecordCount EQ 1>
                    <cfset local.status=hash('2','sha')>
                    <cflocation  url="../login.cfm?status=#local.status#" addtoken="no">
                </cfif>
            <cfelse>
                <cflocation  url="../signup.cfm?status=#local.status#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('3','sha')>
            <cflocation  url="../signup.cfm?status=#local.status#" addtoken="no">
        </cfif>      
    </cffunction>
    <!----<cffunction  name="checkLogin" access="remote">
        <cfoutput>
        #IsUserLoggedIn()#
        </cfoutput>
        <cfif IsUserLoggedIn() EQ "NO">
            <cflocation  url="../modals/create_theatre.cfm" addtoken="no">

        </cfif>
    </cffunction>---->

     <cffunction name="userLogin" access="remote" output="true" >
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="pass" type="string" required="true">
        <cfargument  name="show_id" type="integer">
        <cfargument  name="movie_id" type="integer">
        <cfargument  name="cdate" type="date">
           
        <cfset local.password=hash(arguments.pass,'sha') >       
        <cfquery name="userLogData"  result="user_log">
            SELECT * FROM movie_ticket.login 
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
             AND password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>   
        <cfif user_log.recordCount EQ 1>                      
            <cfset session.userLog={'user_id'=userLogData.id,'user_name'=userLogData.user_name,'email_id'=userLogData.email_id}>   
             <cfif userLogData.role=='user'>
                <cfif arguments.login_value EQ "0">
                    <cflocation  url="../index.cfm" addtoken="no">
                <cfelse>    
                    <cflocation  url="../book-ticket.cfm?id=#toBase64(arguments.show_id)#&mid=#toBase64(arguments.movie_id)#&date=#toBase64(arguments.cdate)#" addtoken="no">
                </cfif>
            </cfif>
        <cfelse>
            <cfset local.status=hash('1','sha')>
            <cflocation  url="../login.cfm?status=#local.status#" addtoken="no">            
        </cfif>   
    </cffunction>

    <cffunction  name="allUsers" access="public">
        <cfquery name="user_list" result="user_res">
            SELECT * from movie_ticket.login WHERE role="user" ORDER BY reg_time DESC
        </cfquery>
        <cfreturn user_list>
    </cffunction>

    <cffunction  name="contactList" access="public">
        <cfquery name="contact_list" result="contact_res">
            SELECT * from movie_ticket.contact_us ORDER BY ontime DESC
        </cfquery>
        <cfreturn contact_list>
    </cffunction>

    <cffunction  name="getTheatreSeats" access="remote" returnFormat = "json">
        <cfargument  name="show_id" type="integer">
        <cfquery name="seat_list" result="user_res" returntype="array">
            SELECT s.seat_name,r.paid,r.show_id FROM movie_ticket.reservation r
            INNER JOIN movie_ticket.seat s ON r.id=s.reserve_id
            WHERE r.paid=<cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">  
            and  r.show_id=<cfqueryparam value="#arguments.show_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn seat_list>
    </cffunction>

    <cffunction  name="deleteUser" access="remote">
        <cfargument  name="id" type="integer">
        <cfquery name="user_list" result="user_res">
            DELETE from movie_ticket.login WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset local.status=hash('1','sha')>
        <cflocation url="../admin/user_list.cfm?status=#local.status#" addtoken="no">
    </cffunction>
    
    <cffunction name="proceedPayment" access="remote">
        <cfargument  name="seats" type="string">
        <cfargument  name="tprice" type="string">
        <cfargument  name="time_sl" type="integer">
        <cfargument  name="show_id" type="integer">
        <cfargument  name="date" type="date">
        <cfset local.seat_split =arguments.seats.Split(",")>     
        <cfset local.seat_num=ArrayLen(seat_split)>
        <cfquery name="select_seat" result="select_res">
            SELECT * FROM movie_ticket.reservation WHERE 
            seats=<cfqueryparam value="#arguments.seats#" cfsqltype="CF_SQL_VARCHAR"> 
            AND show_id=<cfqueryparam value="#arguments.show_id#" cfsqltype="CF_SQL_INTEGER"> 
        </cfquery>
        <cfif select_res.RecordCount EQ 0>
            <cfquery name="reserve" result="reserve_res">
                    INSERT into movie_ticket.reservation(
                        seats,
                        seat_num,
                        select_date,
                        time_slot,
                        show_id,
                        price,
                        paid
                    )
                    VALUES(
                        <cfqueryparam value="#arguments.seats#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#local.seat_num#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.date#" cfsqltype="CF_SQL_DATE">,
                        <cfqueryparam value="#arguments.time_sl#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#arguments.show_id#" cfsqltype="CF_SQL_INTEGER">,
                        <cfqueryparam value="#arguments.tprice#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="0" cfsqltype="CF_SQL_INTEGER">
                    )
            </cfquery>
            <cfloop from="1" to="#local.seat_num#" index="i">                     
                <cfquery name="seat_ins" result="seat_res">
                    INSERT into movie_ticket.seat(
                    seat_name,
                    reserve_id
                    )
                    VALUES(
                    <cfqueryparam value="#local.seat_split[i]#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#reserve_res.GENERATED_KEY#" cfsqltype="CF_SQL_INTEGER">
                    )
                </cfquery>
            </cfloop>                 
            <cfif reserve_res.RecordCount EQ 1 && seat_res.RecordCount NEQ 0>
                <cfset reserve_id=reserve_res.GENERATED_KEY>
                <cflocation  url="../payment.cfm?reserve_id=#toBase64(reserve_id)#" addtoken="no">       
            </cfif>
        </cfif>
        <!---<cfset sh_id=toBase64(arguments.show_id)>
        <cfset tp=toBase64(arguments.tprice)>
        <cfset ts=toBase64(arguments.time_sl)>
        <cfset pdate=toBase64(arguments.date)>
        <cfset seat_num=toBase64(arguments.seats)>---->
    </cffunction>
    
    <cffunction name="getReservation" access="remote">
        <cfargument name="id" type="integer">
        <cfquery name="reserve_res" result="reserve">
            SELECT r.seats,r.seat_num,r.select_date, r.price ,r.show_id,r.id,
            m.movie_name,m.language,m.genre,m.movie_format,
            th.theatre_name,th.address,
            s.screen_name,
            sh.theatre_id,sh.total_seats,
            st.start_time,st.show_name,
            m.id as m_id , sh.id as sh_id, s.id as s_id , st.id as st_id ,th.id as th_id
            FROM reservation r INNER JOIN manage_shows sh ON r.show_id=sh.id
            INNER JOIN screen_show_time st ON st.id=r.time_slot
            INNER JOIN theatre th ON th.id=sh.theatre_id
            INNER JOIN movie m ON m.id=sh.movie_id
            INNER JOIN screen s ON s.id=sh.screen_id
            WHERE r.id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn reserve_res>
    </cffunction>

    <cffunction name="getBookDetails" access="remote">
        <cfargument name="id" type="integer">
        <cfquery name="book_res" result="res_book">
            SELECT t.ticket_id ,t.payment_id, book_date,book_time,r.seats,r.seat_num,r.select_date, r.price ,r.show_id,r.id,
                m.movie_name,m.language,m.genre,m.movie_format,
                th.theatre_name,th.address,
                s.screen_name,
                sh.theatre_id,sh.total_seats,
                st.start_time,st.show_name,
                m.id as m_id , sh.id as sh_id, s.id as s_id , st.id as st_id ,th.id as th_id
                FROM book_ticket t INNER JOIN reservation r ON t.reserve_id=r.id
                INNER JOIN manage_shows sh ON r.show_id=sh.id
                INNER JOIN screen_show_time st ON st.id=r.time_slot
                INNER JOIN theatre th ON th.id=sh.theatre_id
                INNER JOIN movie m ON m.id=sh.movie_id
                INNER JOIN screen s ON s.id=sh.screen_id
                WHERE r.id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn book_res>
    </cffunction>

    <cffunction name="getBookings" access="remote">        
        <cfquery name="book_res" result="res_book">
            SELECT t.ticket_id ,t.payment_id, t.book_date,t.book_time,r.seats,r.seat_num,r.select_date, r.price ,r.show_id,r.id,
                m.movie_name,m.language,m.genre,m.movie_format,
                th.theatre_name,th.address,
                s.screen_name,
                sh.theatre_id,sh.total_seats,
                st.start_time,st.show_name,
                m.id as m_id , sh.id as sh_id, s.id as s_id , st.id as st_id ,th.id as th_id
                FROM book_ticket t INNER JOIN reservation r ON t.reserve_id=r.id
                INNER JOIN manage_shows sh ON r.show_id=sh.id
                INNER JOIN screen_show_time st ON st.id=r.time_slot
                INNER JOIN theatre th ON th.id=sh.theatre_id
                INNER JOIN movie m ON m.id=sh.movie_id
                INNER JOIN screen s ON s.id=sh.screen_id
                WHERE t.user_id=<cfqueryparam value="#session.userLog.user_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn book_res>
    </cffunction>

    <cffunction name="getAllBookings" access="remote">        
        <cfquery name="book_all_res" result="res_book">
             SELECT t.ticket_id ,l.user_name,l.email_id,payment_id, t.book_date,t.book_time,r.seats,r.seat_num,r.select_date, r.price ,r.show_id,r.id,
                m.movie_name,m.language,m.genre,m.movie_format,
                th.theatre_name,th.address,
                s.screen_name,
                sh.theatre_id,sh.total_seats,
                st.start_time,st.show_name,
                m.id as m_id , sh.id as sh_id, s.id as s_id , st.id as st_id ,th.id as th_id
                FROM book_ticket t INNER JOIN reservation r ON t.reserve_id=r.id
                INNER JOIN manage_shows sh ON r.show_id=sh.id
                INNER JOIN screen_show_time st ON st.id=r.time_slot
                INNER JOIN theatre th ON th.id=sh.theatre_id
                INNER JOIN movie m ON m.id=sh.movie_id
                INNER JOIN screen s ON s.id=sh.screen_id
                INNER JOIN login l ON l.id=t.user_id                
        </cfquery>
        <cfreturn book_all_res>
    </cffunction>

    <cffunction name="confirmPayment" access="remote">
        <cfargument  name="reserve_id" type="integer">
        <cfargument  name="pay_id" type="string">
        <cfif Len(Trim(arguments.pay_id)) GT 0>
            <cftransaction>
                <cfquery name="update_reserve" result="up_reserve">
                    UPDATE movie_ticket.reservation 
                    SET paid=<cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
                    WHERE id=<cfqueryparam value="#arguments.reserve_id#" cfsqltype="CF_SQL_INTEGER">
                </cfquery>
                <cfquery name="select_booked" result="book_show_res">
                    SELECT sh.booked_seat FRom movie_ticket.manage_shows sh 
                    inner join movie_ticket.reservation r ON r.show_id=sh.id 
                    WHERE r.id=<cfqueryparam value="#arguments.reserve_id#" cfsqltype="CF_SQL_INTEGER">
                </cfquery>
                <cfoutput query="select_booked">
                    <cfset local.booked=booked_seat>                
                </cfoutput>
                <cfset local.id=arguments.reserve_id>
                <cfset reserve_data=getReservation(local.id)>
                <cfoutput query='reserve_res'>
                    <cfset local.ticket_id="BKID" & m_id & th_id & s_id & st_id & sh_id & id>
                    <cfset local.total_booked=local.booked+seat_num>                
                </cfoutput>            
                <cfquery name="insert_ticket" result="ins_ticket">
                    INSERT into movie_ticket.book_ticket(
                            ticket_id,
                            payment_id,
                            book_date,
                            book_time,
                            reserve_id,
                            user_id                        
                        )
                        VALUES(
                            <cfqueryparam value="#local.ticket_id#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.pay_id#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#dateformat(now(),"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE">,
                            <cfqueryparam value="#timeFormat(now(), "hh:mm:ss")#" cfsqltype="CF_SQL_TIME">,
                            <cfqueryparam value="#arguments.reserve_id#" cfsqltype="CF_SQL_INTEGER">,
                            <cfqueryparam value="#session.userLog.user_id#" cfsqltype="CF_SQL_INTEGER">                      
                        )
                </cfquery>
                <cfquery name="up_book" result="booked_res">
                    UPDATE movie_ticket.manage_shows sh
                    INNER JOIN movie_ticket.reservation r ON  sh.id=r.show_id SET 
                    sh.booked_seat=<cfqueryparam value="#local.total_booked#" cfsqltype="CF_SQL_NUMERIC">
                    WHERE r.id=<cfqueryparam value="#arguments.reserve_id#" cfsqltype="CF_SQL_INTEGER">
                </cfquery>
            </cftransaction>
        </cfif>
        
        <cfif ins_ticket.RecordCount  NEQ 0 && booked_res.RecordCount NEQ 0> 
            <cflocation  url="../ticket_download.cfm?reserve_id=#toBase64(arguments.reserve_id)#" addtoken="no">
        </cfif>
    </cffunction>

    <cffunction name="contactUs" access="remote">
        <cfargument  name="name" type="string">
        <cfargument  name="email" type="string">
        <cfargument  name="subject" type="string">
        <cfargument  name="message" type="string">
        <cfif arguments.name!="" && arguments.email!="" && arguments.subject!="" && arguments.message!="">
            <cfquery name="contact_us" result="result">
                INSERT INTO movie_ticket.contact_us(
                    name,
                    email_id,
                    subject,
                    message,
                    ondate,
                    ontime) 
                VALUES(
                    <cfqueryparam value="#arguments.name#" cfsqltype="CF_SQL_VARCHAR">,                    
                    <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.subject#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.message#" cfsqltype="CF_SQL_VARCHAR"> ,  
                    <cfqueryparam value="#dateformat(now(),"yyyy-mm-dd")#" cfsqltype="CF_SQL_DATE">,
                    <cfqueryparam value="#timeformat(now(),"HH:n:ss")#" cfsqltype="CF_SQL_TIME">                    
                    )
            </cfquery>
            <cfif result.RecordCount EQ 1>
                <cfset local.status=hash('1','sha')>
            </cfif>
        <cfelse>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cflocation  url="../contact-us.cfm?status=#local.status#">
    </cffunction>

</cfcomponent>




