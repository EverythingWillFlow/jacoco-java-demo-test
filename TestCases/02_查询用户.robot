*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_查询用户成功
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=query
    log    ${response.text}
    Should Contain    ${response.text}    query success

002_请求不带opertype_查询失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=username=tom
    Should Contain    ${response.text}    opertype is null

003_请求opertype不识别_查询失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${URI}    params=opertype=test
    Should Contain    ${response.text}    opertype unrecognized
