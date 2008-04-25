VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "NMR-STAR Dictionary Editor  -  Control Panel"
   ClientHeight    =   1185
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12570
   LinkTopic       =   "Form1"
   ScaleHeight     =   1185
   ScaleWidth      =   12570
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Find next incomplete tag"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   720
      Width           =   2175
   End
   Begin VB.ListBox List2 
      Height          =   450
      Left            =   8400
      TabIndex        =   5
      Top             =   600
      Width           =   2175
   End
   Begin VB.ListBox List1 
      Height          =   450
      Left            =   5760
      TabIndex        =   3
      Top             =   600
      Width           =   2055
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Next"
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save"
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "Schema data tag choice"
      Height          =   375
      Left            =   8400
      TabIndex        =   6
      Top             =   120
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Schema saveframe choice"
      Height          =   375
      Left            =   5760
      TabIndex        =   4
      Top             =   120
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
