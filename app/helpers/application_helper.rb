module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
      else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
      redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end


  def up_vote_link_classes(post)
    des = ''
    #klass = "class: "
    #stub = "glyphicon glyphicon-chevron-down "
    #logic = "#{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : '' }"
    current_vote = current_user.voted(post)
    if current_vote && current_vote.up_vote?
        des = 'voted'
    end
    des
  end

  def down_vote_link_classes(post)
    des = ''
    current_vote = current_user.voted(post)
    if current_vote && current_vote.down_vote?
        des = 'voted'
    end
    des
  end
end
