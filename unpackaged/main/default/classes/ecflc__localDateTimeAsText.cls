/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class localDateTimeAsText {
    global localDateTimeAsText() {

    }
    @InvocableMethod(label='Local Date Time String')
    global static List<ecflc.localDateTimeAsText.getDateTimeAsTextResult> getLocalDateTime(List<ecflc.localDateTimeAsText.getDateTimeAsTextRequest> dtatList) {
        return null;
    }
global class getDateTimeAsTextRequest {
    @InvocableVariable(label='Date Time Format (String)' required=true)
    global String dateTimeFormat;
    @InvocableVariable(label='Date/Time Value (Date/Time)' required=true)
    global Datetime dateTimeValue;
    global getDateTimeAsTextRequest() {

    }
}
global class getDateTimeAsTextResult {
    @InvocableVariable(label='Date Time as Text (String)' required=false)
    global String dateTimeAsText;
    global getDateTimeAsTextResult() {

    }
}
}
