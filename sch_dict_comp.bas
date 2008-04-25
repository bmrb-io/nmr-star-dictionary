Attribute VB_Name = "sch_dict_comp"

Sub main()

Dim schema_tags(3000, 1 To 2) As String
Dim dictionary_tags(3000, 1 To 2) As String

Dim n1, n2, n3 As Integer

Open "c:\bmrb\htdocs\dictionary\htmldocs\nmr_star\dictionary_files\harvest_schema.txt" For Input As 1
Open "c:\bmrb\htdocs\dictionary\htmldocs\nmr_star\dictionary_files\dictharvest2.txt" For Input As 2

load_schema_tags schema_tags, n1
load_dictionary_tags dictionary_tags, n2
Close

compare_schema_vs_dictionary schema_tags, n1, dictionary_tags, n2

Open "c:\bmrb\htdocs\dictionary\htmldocs\nmr_star\dictionary_files\dictharvest.txt" For Input As 2
Open "c:\bmrb\htdocs\dictionary\htmldocs\nmr_star\dictionary_files\dictharvest3.txt" For Output As 3
Open "c:\bmrb\htdocs\dictionary\htmldocs\nmr_star\dictionary_files\dict_item_insert.txt" For Input As 4

'append_dictionary schema_tags, n1
Close

Debug.Print
Debug.Print "Finished"

End Sub
Sub append_dictionary(schema_tags, n1)

Dim dict_insert(300), dict_insert2(300) As String
Dim tt, n5 As Integer
Dim t1 As String

t1 = ""
n5 = 0
While EOF(4) <> -1
    t = Input$(1, 4)
    'Debug.Print t
    tt = Asc(t)
    t1 = t1 + t
    If tt = 10 Then
        n5 = n5 + 1
        dict_insert(n5) = t1
        Debug.Print dict_insert(n5)
        Debug.Print
        t1 = ""
    End If
Wend

t1 = ""
While EOF(2) <> -1
    t = Input$(1, 2)
    tt = Asc(t)
    t1 = t1 + t
    If tt = 10 Then
        Print #3, t1;
        t1 = ""
    End If
Wend

For i = 1 To n1
    If schema_tags(i, 2) <> "y" Then
        For j = 1 To n5
            dict_insert2(j) = dict_insert(j)
            p = InStr(1, dict_insert2(j), "save__")
            If p > 0 Then dict_insert2(j) = "save_" + schema_tags(i, 1) + Chr$(10)
            p = InStr(1, dict_insert2(j), "_Tag_name")
            If p > 0 Then dict_insert2(j) = "  _Tag_name      " + "'" + schema_tags(i, 1) + "'" + Chr$(10)
            Print #3, dict_insert2(j);
        Next j
    End If
Next i
    
    
End Sub
Sub load_schema_tags(schema_tags, n1)

Dim n, i, j As Integer
Dim t As String

n = 0
While EOF(1) <> -1
    Input #1, t
    p = InStr(1, t, "_")
    If p = 1 Then
        p = InStr(1, t, "@")
        If p > 0 Then t = Left$(t, p - 1)
        p = InStr(1, t, " ")
        If p > 0 Then t = Left$(t, p - 1)
        t = Trim$(t)
        n = n + 1
        schema_tags(n, 1) = t
        Debug.Print n, "'"; t; "'"
        Debug.Print
    End If
Wend
For i = 1 To n
    For j = 1 To n
        If i <> j Then
            If schema_tags(i, 1) = schema_tags(j, 1) Then schema_tags(j, 1) = ""
        End If
    Next j
Next i
n1 = 0
For i = 1 To n
    If schema_tags(i, 1) > "" Then
        n1 = n1 + 1
        schema_tags(n1, 1) = schema_tags(i, 1)
        Debug.Print n1, schema_tags(n1, 1)
    End If
Next i


End Sub

Sub load_dictionary_tags(dictionary_tags, n2)

Dim i, j, n As Integer
Dim t As String

n = 0
While EOF(2) <> -1
    Input #2, t
    t = Trim$(t)
    p = InStr(1, t, "save__")
    If p = 1 Then
        p = InStr(1, t, " ")
        If p > 0 Then t = Left$(t, p - 1)
        ln = Len(t)
        t = Right$(t, ln - 5)
        t = Trim$(t)
        If t > " " Then
            n = n + 1
            dictionary_tags(n, 1) = t
            Debug.Print n, "'"; t; "'"
            Debug.Print
        End If
    End If
Wend

For i = 1 To n
    For j = 1 To n
        If i <> j Then
            If dictionary_tags(i, 1) = dictionary_tags(j, 1) Then
                Debug.Print dictionary_tags(i, 1)
                Debug.Print
                dictionary_tags(j, 1) = ""
            End If
        End If
    Next j
Next i
n2 = 0
For i = 1 To n
    If dictionary_tags(i, 1) > "" Then
        n2 = n2 + 1
        dictionary_tags(n2, 1) = dictionary_tags(i, 1)
        Debug.Print n2, dictionary_tags(n2, 1)
    End If
Next i


End Sub

Sub compare_schema_vs_dictionary(schema_tags, n1, dictionary_tags, n2)

n3 = 0
For i = 1 To n1
    For j = 1 To n2
        If schema_tags(i, 1) = dictionary_tags(j, 1) Then
            n3 = n3 + 1
            dictionary_tags(j, 2) = "y"
            schema_tags(i, 2) = "y"
        End If
    Next j
Next i
Debug.Print
For i = 1 To n2
    If dictionary_tags(i, 2) <> "y" Then
        Debug.Print dictionary_tags(i, 1)
    End If
Next i
Debug.Print
Debug.Print n1, n2, n3
End Sub

Sub write_tag_html(schema_tags, n1)

Dim t3(300) As String
Dim t As String
Dim t1, t2 As String
Dim n3 As Integer

For i = 1 To n1
    If schema_tags(i, 2) = "y" Then
        Open "c:\bmrb\htdocs\dictionary\nmr_star\dictionary_files\dictharvest.txt" For Input As 1
        While EOF(1) <> -1
            Input #1, t
            t = Trim$(t)
            p = InStr(1, t, "save__")
            If p = 1 Then
                p = InStr(1, t, " ")
                If p > 0 Then t = Left$(t, p - 1)
                ln = Len(t)
                t1 = Right$(t, ln - 5)
                t1 = Trim$(t)
                If t1 > " " Then
                    If t1 = schema_tags(i, 1) Then
                        n3 = 1
                        t3(n3) = t
                        While t2 <> "save_"
                            Input #1, t
                            t = Trim$(t)
                            t2 = t
                            n3 = n3 + 1
                            t3(n3) = t2
                        Wend
                        Close 1
                        create_tag_html t3, n3, t1
                    End If
                End If
            End If
        Wend
    End If
    
    If schema_tags(i, 2) <> "y" Then
        create_null_tag_html t1
    End If
    
Next i

End Sub

Sub create_tag_html(t3, n3, t1)

Open "c:\bmrb\htdocs\dictionary\nmr_star\dict_html_pages\tags\dict_sf" + t1 + ".html" For Output As 1

Print #1, "<HTML>"
Print #1, "<HEAD>"
Print #1, "<TITLE>Tag _Mol_system_name</TITLE>"
Print #1, "</HEAD>"


print #1,"<BODY BGCOLOR="#FFFFCC" TEXT="#660000" LINK="#660000" VLINK="#999966" ALINK="#999966">
Print #1, "<CENTER><TABLE BORDER="; 0; " CELLPADDING="; 0; " CELLSPACING="; 0; " WIDTH="; 80; " HEIGHT="; 80; ">"

Print #1, "<TR>"
Print #1, "<TD COLSPAN=2>&nbsp</TD><TD COLSPAN=2>&nbsp</TD>"
Print #1, "</TR>"
Print #1, "<TR>"
Print #1, "     <TD VALIGN="; Top; " ><FONT SIZE=5 FACE="; helvetica, arial, times; ">"
Print #1, "            <B> NMR-STAR Dictionary Tag Definition Saveframe</B>"
Print #1, "    </TD>"
Print #1, "   <TD>"
print #1,"     <IMG SRC="../../logo.gif" WIDTH="56" HEIGHT="60" BORDER="0">
Print #1, "   </TD>"

Print #1, " </TR>"
Print #1, "</TABLE>"
Print #1, "</CENTER>"
Print #1, "<HR>"


Print #1, "<CENTER><TABLE COL="; 2; " WIDTH="; 90; " BORDER="; 0; ">"
Print #1, "<TR><TD>"
Print #1, "<A HREF = "; htm_mol_system_name_tag.htm; ">Tag description page</A>"
Print #1, "   </TD>"
print #1,"   <TD><A HREF = "../molecular_system_saveframe_txt.htm">Back to NMR-STAR
Print #1, "saveframe (molecular_system)</A>"
Print #1, "   </TD>"
Print #1, "</TR>"
Print #1, "</TABLE></CENTER>"
Print #1, " <CENTER>________________________________________________</CENTER>"
Print #1, "<BR>"

Print #1, "<PRE>"


End Sub

Sub create_null_tag_html(t1)



End Sub
