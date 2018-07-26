*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_删除全部用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${UserURI}    params=opertype=del
    Should Contain    ${response.text}    delete all users success

002_删除不存在的用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${UserURI}    params=opertype=del&name=test
    Should Contain    ${response.text}    user not exist

003_删除单个用户
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${UserURI}    params=opertype=add&name=tom&password=123
    ${response}    Get Request    API    ${UserURI}    params=opertype=del&name=tom
    Should Contain    ${response.text}    delete success
