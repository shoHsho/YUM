function ShowOnly(divID) {
    //Debug.write("stuff is being done");
    $("#MainPanels div").show();
    $("#MainPanels div:not(#" + divID + ")").hide();

}