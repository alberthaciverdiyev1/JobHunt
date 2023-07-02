function sendInvite() {
    var inviteMessage = document.getElementById("inviteMessage").value;
    var recipientId = @Model.UserPostJob.AppUserId;

    $.ajax({
        url: "/Message/SendMessage",
        type: "POST",
        data: {
            send: {
                Description: inviteMessage,
                ReceiverId: recipientId
            }
        },
        success: function (response) {
            $("#successModal").modal("show");
        },
        error: function (error) {
        
        }
    });

    $("#inviteModal").modal("hide");
}
