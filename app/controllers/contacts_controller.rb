class ContactsController < ApplicationController

     def new
          @contact = Contact.new
     end

     # 
     # お問い合わせをDBに保存し、メールを送信する。
     # 
     def create
          # フォームから送信された値でインスタンスを作成する。
          @contact = Contact.new(contact_params)
          
          # DBに保存する。保存に失敗した際は、処理しない。
          if @contact.save
               # お問い合わせメールを送信する。
               # ※）引数はcontactsテーブルに保存された値。
               ContactMailer.sent(@contact).deliver  # sentアクションにcontactの情報をもたせます。
               ContactMailer.sent(@contact).deliver
               
               # 画面に処理が成功した旨、表示する。
               flash[:success] = "Thanks!! We'll be in touch."
               # root_urlに画面を遷移させる。
               redirect_to root_url
          end
     end

     private

          def contact_params
               params.require(:contact).permit(:name, :email, :age, :content)
          end
end