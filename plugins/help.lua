local function run(msg, matches)
local group = load_data('bot/group.json')	
local addgroup = group[tostring(msg.chat_id)]	
if matches[1] == 'help' and is_momod(msg) or is_owner(msg) and addgroup then
pm1 = [[🔴⚜🔐help lock🔐⚜🔴

🔹!lock links  =>قفل لینک
🔹!lock edit =>قفل ویرایش پیام 
🔹!lock fwd  =>قفل فروارد 
🔹!lock spam  =>قفل اسپم 
🔹!lock inline  =>قفل اینلاین 
🔹!lock arabic  =>قفل فارسی 
🔹!lock english => قفل انگلیسی
🔹!lock fosh => قفل فحش
🔹!lock username (@) => قفل یوزرنیم 
🔹!lock sticker  =>قفل استیکر 
🔹!lock tag (#)  =>قفل تگ 
🔹!lock tgservice  =>قفل سرویس 
🔹!lock audio  =>قفل آهنگ
🔹!lock voice => قفل صدا
🔹!lock photo  =>قفل عکس 
🔹!lock gifs  =>قفل گیف 
🔹!lock video  =>قفل فیلم 
🔹!lock document  =>قفل فایل 
🔹!lock contact =>قفل شماره 
🔹!lock location => قفل موقعیت مکانی 
🔹!lock game => قفل بازی تحت وب 
🔹!mute all  => سایلنت گپ
🔹!unmute all => خارج کردن گپ از سایلنت 

🔴برای غیر فعال کردن قفل ها بجای lock کلمه unlock قرار دهید
------------------------------------------------------------------------
🔵👤help Mod👤🔵

🔺!promote [id-reply] =>مدیر کردن فرد 

🔻!demote [id-reply] =>حذف فرداز مدیریت 

🔺!settings =>تنظیمات 

🔺!setlink [link] =>تنظیم لینک گروه

🔻!link =>دریافت لینک گروه

🔺!setrules [text] =>تنظیم قوانین گروه

🔻!rules =>دریافت قوانین گروه 

🔺!id =>دریافت شناسه عددی خود و گروه

🔻!id [reply-username] =>دریافت ایدی عددی فرد

🔺!kick [id-username-reply] =>اخراج فرد
------------------------------------------------------------------------
📢Channel: @senator_tea ]]
  tg.sendMessage(msg.chat_id_, 0, 1, pm1, 1, 'md')
end
end
	
return {
  patterns = {
  "^[/#!](help)$",
		
  },
  run = run
}
