<?php


namespace App\Command;

use App\Models\User;
use App\Services\Config;
use App\Services\Mail;

class DailyMail
{

    public static function sendDailyMail()
    {
        $users = User::all();
        foreach ($users as $user) {
            echo "Send daily mail to user: " . $user->id;
            $subject = Config::get('appName') . "-每日流量报告";
            $to = $user->email;
            try {
                Mail::send($to, $subject, 'news/daily-traffic-report.tpl', [
                    "user" => $user
                ], [
                ]);
            } catch (Exception $e) {
                echo $e->getMessage();
            }
        }
    }
    
    public static function sendexpiredMail()
    {
        $users = User::all();
        foreach ($users as $user) {
          $datenow = date("Y-m-d");
          $expireday = $user->expire_at;
          $informday = date("Y-m-d",strtotime("-1 day $expireday"));
          if ($datenow == $informday){
            echo "Send account expired mail to user: " . $user->id;
            $subject = Config::get('appName') . "-您的账户即将到期";
            $to = $user->email;
            $text = "您好:<br>&emsp;&emsp;您的账户将于 ".$expireday." 到期，请及时联系管理员；如已经联系处理，请忽略本邮件。谢谢！";
            try {
                Mail::send($to, $subject, 'news/account-expire-info.tpl', [
                    "user" => $user,"text" => $text
                ], [
                ]);
            } catch (Exception $e) {
                echo $e->getMessage();
            }
          }
        }
    }
    
}