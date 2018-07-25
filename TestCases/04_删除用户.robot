*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_删除全部用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=del
    Should Contain    ${response.text}    delete all users success

002_删除不存在的用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=del&username=test
    Should Contain    ${response.text}    user not exist

003_删除单个用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=add&username=tom&password=123
    ${response}    Get Request    API    ${URI}    params=opertype=del&username=tom
    Should Contain    ${response.text}    delete success
