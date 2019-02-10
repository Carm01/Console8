# Console8
Console 8 ( certipoint MS office testing app ) app designed to keep certain services from running during testing which could cause issues per their documentation


The following are directions for Console 8 set up on any
machine. Below is the manual process if you choose to not use the scripting
options in the other document describing what the scripts.

1) Download console 8 application from here with your login: http://www.certiport.com/portal/DesktopDefault.aspx

2) Windows updates should be disabled.

3) Run Console_Setup.exe under admin privileges,the install should not take long.

4) Run INstaller.exe. This will take care of any behind the scenes things that I came across that needs to be done. ( see script document )

5) An Office application must be launched, and verified for activation.

6) Outlook must be set up in offline mode for an offline profile.

7) Console 8 must be updated for anything for MS Office, Program, or console related. Anything Adobe, Autodesk, etc... do not
have to be updated as that will take over an hour to preform and is unnecessary from my testing.

8) Launch console 8 once all this is done and go to the diagnostic button, and verify that Outlook and another program run through
the config testing works successfully.

9) ANY office application, browser should be closed prior to the launch of the Console 8. Also the service msiserver or msiexec.exe
specifically should not be running hence what the scripted solutions do running
it manually will not take any of this into account.
