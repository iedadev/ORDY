<%
' NON CANCELLARE!!!! FILE CONTENENTE LE FUNZIONI NECESSARIE PER LE ATTIVITA GENERICHE
Function ModificaApici(ByVal s)
Dim i
Dim t
ModificaApici = s
	If IsNull(s) Then Exit Function
	If s = "" Then Exit Function
	t = ""
	For i = 1 To Len(s)
		If Mid(s, i, 1) = "'" Then
		  t = t + "'" + Mid(s, i, 1)
		Else
		  t = t + Mid(s, i, 1)
		End If
	Next 
	ModificaApici = t
End Function

function PCase(strInput)
	'Variable declaration.
    	Dim strArr
    	Dim tmpWord
    	Dim tmpString
    	Dim last
    	
    	'Create an array To store Each word In the String separately.
    	strArr = split(strInput," ")
    	
    	if ubound(strArr) > 0 Then
    		For x = lbound(strArr) To ubound(strArr)
    			'Set Each word To lower Case initially.
    			strArr(x) = LCase(strArr(x))
    			
    			'Skip the unimportant words.
    			Select Case strArr(x)
    				Case "and"
    				Case "but"
    				Case "by"
    				Case "for"
    				Case "in"
    				Case "into"
    				Case "is"
    				Case "of"
    				Case "off"
    				Case "on"
    				Case "onto"
    				Case "STR."
    					strArr(x) = "Strada"
    				Case "s.c.a.r.l."
    					strArr(x) = "Scarl"
    				Case "VLE"
    					strArr(x) = "Viale"
    				Case "s. f"
    					strArr(x) = "San F"
    				Case "s.c.r.l."
    					strArr(x) = "Scrl"
    				Case "s.a.s."
    					strArr(x) = "Sas"
    				Case "s.n.c."
    					strArr(x) = "Snc"
    				Case "s.r.l."
    					strArr(x) = "Srl"
    				Case "s.p.a."
    					strArr(x) = "Spa"
    				Case "Via Garibaldi"
    					strArr(x) = "Via Giuseppe Garibaldi"
    				Case "sp"
    					strArr(x) = "Strada Provinciale"
    				Case "s.p."
    					strArr(x) = "Strada Provinciale"
    				Case "ss"
    					strArr(x) = "Strada Statale"
    				Case "s.s."
    					strArr(x) = "Strada Statale"
    				Case "v.le"
    					strArr(x) = "Viale"
    				Case "PZA"
    					strArr(x) = "Piazza"
    				Case "p.zza"
    					strArr(x) = "Piazza"
    				Case "ple"
    					strArr(x) = "Piazzale"
    				Case "p.le"
    					strArr(x) = "Piazzale"
    				Case "PTTA"
    					strArr(x) = "Piazzetta"
    				Case "p.za"
    					strArr(x) = "Piazza"
    				Case "Trav."
    					strArr(x) = "Traversa"
    				Case "c.so"
    					strArr(x) = "Corso"
    				Case "b.go"
    					strArr(x) = "Borgo"
    				Case "loc."
    					strArr(x) = "Località"
    				Case "z.i."
    					strArr(x) = "Zona Industriale"
    				Case Else
    				
    					'Capitalize the first letter, but don't forget To take into account that
    					'the String may be in Single or Double quotes.
    					if len(strArr(x)) > 1 Then
    						if mid(strArr(x),1,1) = "'" or mid(strArr(x),1,1) = """" Then
    							tmpWord = mid(strArr(x),1,1) & Ucase(mid(strArr(x),2,1)) & mid(strArr(x),3,len(strArr(x))-2)
    						Else
    							tmpWord = Ucase(mid(strArr(x),1,1)) & mid(strArr(x),2,len(strArr(x))-1)
    						End if
    						strArr(x) = tmpWord
    					End if
    			End Select
    			
    			'The unimportant words may need To be capitalized if they follow a dash, colon,
    			'semi-colon, Single quote or Double quote.
    			if x > 0 Then
    				if instr(strArr(x-1),"-") _
    				or instr(strArr(x-1),":") _
    				or instr(strArr(x-1),";") Then
    					tmpWord = Ucase(mid(strArr(x),1,1)) & mid(strArr(x),2,len(strArr(x))-1)
    					strArr(x) = tmpWord
    				End if
    			End if
    			
    		Next
    	Else
    		strArr(0) = LCase(strArr(0))
    	End if
    	
    	'Make sure the first word In the array is upper case, but don't forget To take into account
    	'that the String may be in Single or Double quotes.
    	if mid(strArr(0),1,1) = "'" or mid(strArr(0),1,1) = """" Then
    		tmpWord = mid(strArr(0),1,1) & Ucase(mid(strArr(0),2,1)) & mid(strArr(0),3,len(strArr(0))-2)
    	Else
    		tmpWord = Ucase(mid(strArr(0),1,1)) & mid(strArr(0),2,len(strArr(0))-1)
    	End if
    	strArr(0) = tmpWord
    	
    	'Also, make sure the last word In the array is upper case, but don't forget To take into account
    	'that the String may be in Single or Double quotes.
    	last = ubound(strArr)
    	if mid(strArr(last),1,1) = "'" or mid(strArr(last),1,1) = """" Then
    		tmpWord = mid(strArr(last),1,1) & Ucase(mid(strArr(last),2,1)) & mid(strArr(0),3,len(strArr(last))-2)
    	Else
    		tmpWord = Ucase(mid(strArr(last),1,1)) & mid(strArr(last),2,len(strArr(last))-1)
    	End if
    	strArr(last) = tmpWord
    	
    	'Rebuild the whole String from the array parts.
    	For x = lbound(strArr) To ubound(strArr)
    		tmpString = tmpString & strArr(x) & " "
    	Next
    	
    	PCase = trim(tmpString)
End function

Function PulisciTel(telefono)
	' Toglie spazi e schifezze dai numeri di telefono
	If IsNull(telefono) Then Exit Function
	If telefono = "" Then Exit Function
	telefono = Trim(telefono)
	telefono = replace(telefono, " ", "")
	telefono = replace(telefono, "+", "")
	telefono = replace(telefono, ".", "")
	telefono = replace(telefono, "-", "")
	telefono = replace(telefono, "/", "")
	telefono = replace(telefono, "ý", "")
	telefono = replace(telefono, "Tel:", "")
	telefono = replace(telefono, "_", "")
	telefono = replace(telefono, "(", "")
	telefono = replace(telefono, ")", "")
	telefono = replace(telefono, "'", "")
	PulisciTel = ModificaApici(telefono)
End Function

Function PulisciMail(email)
	' Toglie spazi e schifezze dalle email
	If IsNull(email) Then Exit Function
	If email = "" Then Exit Function
	email = Trim(email)
	email = LCase(email)
	email = replace(email, " ", "")
	email = replace(email, "&", "")
	email = replace(email, ",", ".")
	email = replace(email, "ò", "@")
	email = replace(email, "ç", "@")
	email = replace(email, "@@", "@")
	email = replace(email, "..", ".")
	email = replace(email, "è", "e")
	email = replace(email, "é", "e")
	email = replace(email, "ò", "o")
	email = replace(email, "à", "a")
	email = replace(email, "ù", "u")
	email = replace(email, "ì", "i")
	PulisciMail = email
End Function

function ControllaEmail(email)
   ' Verifica la validità di un indirizzo email
   ' Ritorna <> "0" se l'indirizzo è sintatticamente errato
   dim atCnt
   ControllaEmail = "0"

	' Verifica la lunghezza
	If len(trim(email)) < 6 Then
		ControllaEmail = "Indirizzo Email troppo corto!"
	End If

	' Verifica che abbia almeno una @
	If InStr(email,"@") = 0 Then
		ControllaEmail = "Manca il carattere @!"
	End If
	
	' Verifica che abbia solo una @
	atCnt = 0
	For i = 1 to Len(email)
		If  mid(email,i,1) = "@" then
			atCnt = atCnt + 1
		End If
	Next
	If atCnt > 1 Then
		ControllaEmail = "Troppi caratteri @!"
	End If

	' Verifica che abbia almeno un .
	If InStr(email,".") = 0 Then
		ControllaEmail = "Inserire almeno un . nell'indirizzo!"
	End If 

	' Verifica che non ci siano più di 4 caratteri dopo l'ultimo punto
	If Len(email) - InStrRev(email,".") > 4 Then
		ControllaEmail = "Il suffisso del dominio è troppo lungo"
	End If

	' Verifica che non ci sia _ dopo la @
	If InStr(email,"@_") > 0 Then
		ControllaEmail = "Carattere Errato dopo la @!"
	End If 

	' Verifica che non ci sia . dopo la @
	If InStr(email,"@.") > 0 Then
		ControllaEmail = "Carattere Errato dopo la @!"
	End If 

	' Verifica che non ci sia . prima della @
	If InStr(email,".@") > 0 Then
		ControllaEmail = "Carattere Errato prima della @!"
	End If 

	' Verifica i caratteri ammessi nell'indirizzo
	For i = 1 to Len(email)
		If Not IsNumeric(Mid(email,i,1)) And _
		(Mid(email,i,1) < "a" Or _
		Mid(email,i,1) > "z") And _
		Mid(email,i,1) <> "_" And _
		Mid(email,i,1) <> "." And _
		Mid(email,i,1) <> "@" And _
		Mid(email,i,1) <> "-" Then
            ControllaEmail = "Carattere non consentito all'interno dell'indirizzo!"
        End If
	Next
End Function


Sub ChiudiChiamata(NomeDL, NomeQR, Stato, CLI)
	' Chiude chiamata nel sistema
	Set dbConn2 = CreateObject("ADODB.Connection")
	dbConn2.Open Application("Connection2_ConnectionSTring")
	Dim ss2
	ss2 = "INSERT INTO elencostati (NomeDL, Stato, Libero, CLI, Datains) VALUES ("
	ss2 = ss2 & "'DL_" & NomeDL & "_" & NomeQR & "', '" & Stato & "', Null, '" & CLI & "', getdate() + 0.003472)"
	Set rs2 = dbConn2.Execute(ss2)
	set dbconn2 = nothing
	set rs2 = nothing

	' Chiude chiamata nel sistema VERIFICHE
	Set dbConn2 = CreateObject("ADODB.Connection")
	dbConn2.Open Application("Connection2_ConnectionSTring")
	Dim ss3
	ss3 = "INSERT INTO elencostati_verifiche (NomeDL, Stato, Libero, CLI, Datains) VALUES ("
	ss3 = ss3 & "'DL_" & NomeDL & "_" & NomeQR & "', '" & Stato & "', Null, '" & CLI & "', getdate() + 0.003472)"
	Set rs3 = dbConn2.Execute(ss3)
	set dbconn2 = nothing
	set rs3 = nothing

End Sub

%>

