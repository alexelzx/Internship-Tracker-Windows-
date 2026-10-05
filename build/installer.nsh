!macro customHeader
  !define MUI_WELCOMEPAGE_TITLE "Welcome to Stage"
  !define MUI_WELCOMEPAGE_TEXT "A calm place to keep every internship conversation moving.$\r$\n$\r$\nStage keeps your outreach, follow-ups, and goals close at hand.$\r$\n$\r$\nAuthor: Alexios ELIZALDE XIROKOSTA.$\r$\nNotice: This student-built application is not digitally signed. Windows may show an unknown-publisher or SmartScreen warning. The next page contains the MIT License."
  !define MUI_FINISHPAGE_TITLE "Stage is ready"
  !define MUI_FINISHPAGE_TEXT "Your internship tracker is installed and ready for thoughtful outreach."
!macroend

!macro customInstall
  WriteRegStr HKCU "Software\Stage" "InstallVersion" "${VERSION}"
!macroend

!macro customUnInstall
  DeleteRegKey HKCU "Software\Stage"
!macroend
