Template.pageFooter.events
  "click #donate_link": (e) ->
    e.preventDefault()
    Session.set "showDonationAddresses", true
    yPosition = $("#donation_block").scrollTop()
    $("html, body").animate({ scrollTop: yPosition }, 500)
    $("#donation_block").slideDown(1000)
