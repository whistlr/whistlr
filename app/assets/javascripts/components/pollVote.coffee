Whistlr.PollVoteComponent = Em.Component.extend(
  canVote: (->
    currentUser = @get('parentView.parentView').auth.get('user')
    return false if !currentUser
    voteableType = @get('voteable').get('model')
    (voteableType == "Report" && currentUser.get('whistlrReputation') > Whistlr.MEMBER) || (currentUser.get('archivistReputation') > Whistlr.MEMBER)
  ).property("voteable")
)