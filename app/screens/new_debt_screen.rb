class NewDebtScreen < PM::FormScreen
  title "Track Another Debt"
  stylesheet NewDebtStylesheet

  def on_load
    set_nav_bar_button :right, title: "Save", action: :save, type: :save
    set_nav_bar_button :left, title: "Cancel", action: :cancel, type: :cancel
  end

  def form_data
    [{
      title: "Debt Details",
      footer: "Some help text",
      cells: [{
        name: "debt_name",
        title: "Who is the debt with?",
        type: :text,
        vallue: ""
      },
      {
        name: "debt_balance",
        title: "What is the current balance?",
        type: :float,
        value: ""
      },
      {
        name: "debt_interest_rate",
        title: "What is the interest rate?",
        type: :float,
        value: ""
      },
      {
        name: "debt_minimum_amount",
        title: "What is the minimum amount?",
        type: :float,
        value: ""
      },
      {
        name: "debt_due_date",
        title: "What is the next due date?",
        type: :text,
        value: ""
      }]
    }]
  end

  def save
    PM.logger.info "Save and close screen."
    close
  end

  def cancel
    close
  end

end


# class MyFormScreen < PM::FormScreen
#   title "My Form"

#   def form_data
#     [{
#       title: "Account Information",
#       footer: "Some help text",
#       cells: [{
#         name: "email",
#         title: "ID",
#         type: :email,
#         value: current_user.email,
#       }, {
#         name: "password",
#         title: "New Password",
#         type: :password,
#         value: ""
#       }]
#     }]
#   end

# end
