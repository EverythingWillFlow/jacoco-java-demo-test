*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_请求不带用户名或密码_添加失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=add
    Should Contain    ${response.text}    username or password is null

002_用户名密码正常_添加成功
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=del
    ${response}    Get Request    API    ${URI}    params=opertype=add&username=tom&password=123
    Should Contain    ${response.text}    add success

003_用户重复_添加失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=add&username=tom&password=123
    Should Contain    ${response.text}    user exists, add failed
