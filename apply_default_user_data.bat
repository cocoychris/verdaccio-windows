@echo off
echo ==============================
echo  還原使用者檔案及設定至預設值
echo ==============================
echo.
echo 將從 default_data 複製檔案至 user_data。若 user_data 內已有檔案，這會覆蓋 user_data 中的檔案，使所有設定被還原至預設值。
echo.
echo 如確定執行，
pause
md user_data
copy /y default_data user_data
pause