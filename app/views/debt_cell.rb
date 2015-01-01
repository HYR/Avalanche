class DebtCell < UITableViewCell
  def on_load

    q_content_view = find(self.contentView)
    q_content_view.apply_style(:cell_content_view)
    @name = q_content_view.append!(UILabel, :cell_name)
    @type = q_content_view.append!(UILabel, :cell_type)

  end

  # Update cell content the Non-ProMotion way
  def update(debt)
    @name.text = debt[:title]
    # @subject.text = debt.last_payment
    # @message.text = debt.estimated_end_date
  end

  # Update cell content the ProMotion way
  def debt=(debt)
    @name.text = debt[:title]
    @type.text = debt[:type]
    # @subject.text = debt.last_payment
    # @message.text = debt.estimated_end_date
  end
end
