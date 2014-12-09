class NewDebtStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def hello(st)
    st.frame = {top: 100, width: 200, height: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'Hello World'
  end

  def close_modal(st)
    st.frame = {top: 300, width: 200, height: 18, centered: :horizontal}
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'New Debt Screen!'
  end

end
