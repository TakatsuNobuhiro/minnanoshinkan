module NotificationsHelper
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @student_visitor = notification.student_visitor
    #コメントの内容を通知に表示する
    @comment = nil
    @visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentかで処理を変える
    case notification.action
    when 'follow'
      #aタグで通知を作成したユーザーshowのリンクを作成
      tag.a(notification.student_visitor.name, href: student_path(@student_visitor)) + 'があなたをフォローしました'
    when 'like'
      tag.a(notification.student_visitor.name, href: student_path(@student_visitor)) + 'が' + tag.a('あなたの投稿', href: event_path(notification.event_id)) + 'にいいねしました'
    when 'comment' then
      #コメントの内容と投稿のタイトルを取得　      
      @comment = Comment.find_by(id: @student_visitor_comment)
      @comment_content =@comment.content
      @event_title =@comment.event.title
      tag.a(@student_visitor.name, href: student_path(@student_visitor)) + 'が' + tag.a("#{@event_title}", href: event_path(notification.event_id)) + 'にコメントしました'
    end
  end


end
