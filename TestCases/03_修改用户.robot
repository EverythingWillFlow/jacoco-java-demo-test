*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_修改存在的用户_成功
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=add&username=tom&password=123
    ${response}    Get Request    API    ${URI}    params=opertype=mod&username=tom&password=456
    Should Contain    ${response.text}    modify success

002_修改不存在的用户_失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=mod&username=test&password=123
    Should Contain    ${response.text}    user not exist

003_请求不带用户名或密码_修改失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=mod
    Should Contain    ${response.text}    username or password is null
