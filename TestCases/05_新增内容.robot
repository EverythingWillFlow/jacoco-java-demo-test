*** Settings ***
Library           RequestsLibrary
Resource          ../Resources/Global_Variables.robot

*** Test Cases ***
001_请求不带名称或数量_添加失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${ZooURI}    params=opertype=add
    Should Contain    ${response.text}    name or count is null

002_名称和数量正常_添加成功
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${ZooURI}    params=opertype=del
    ${response}    Get Request    API    ${ZooURI}    params=opertype=add&name=cat&count=10
    Should Contain    ${response.text}    add success

003_名称重复_添加失败
    Create Session    API    ${URL}
    ${response}    Get Request    API    ${ZooURI}    params=opertype=add&name=cat&count=10
    Should Contain    ${response.text}    name exists, add failed
