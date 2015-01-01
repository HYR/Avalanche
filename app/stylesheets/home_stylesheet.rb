class HomeStylesheet < ApplicationStylesheet
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def focus_cell_height
    140
  end

  def cell_height
    100
  end

  def cell(st)

  end

  def focus_cell(st)

  end

  def cell_content_view(st)
    st.background_color = color.random
  end

  def focus_cell_name(st)
    st.frame = {l: 10, t: 10, w: 200, h: 44}
    st.background_color = color.red
    st.color = color.white
    st.text = "TESTING THIS LABEL"
  end

  def cell_name(st)
    st.frame = {l: 10, t: 10, w: 200, h: 44}
  end

  # def hello_world(st)
  #   st.frame = {top: 100, width: 200, height: 18, centered: :horizontal}
  #   st.text_alignment = :center
  #   st.color = color.battleship_gray
  #   st.font = font.medium
  #   st.text = 'Hello World'
  # end

end
