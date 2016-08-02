<?php


namespace App\Models;

use App\Utils\Tools;


class CheckInLog extends Model
{
    protected $table = "ss_checkin_log";

    public $timestamps = true;

    /**
     * @return string
     */
    public function traffic()
    {
        return Tools::flowAutoShow($this->attributes['traffic']);
    }
    
		public function user()
    {
        $user = User::where("id",$this->attributes['user_id'])->first();
		    if($user == NULL)
		    {
						TrafficLog::where('id','=',$this->attributes['id'])->delete();
						return null;
				}
        else
				{
						return $user;
				}
    }
 
    /**
     * @return mixed
     */
    public function CheckInTime()
    {
        return Tools::toDateTime($this->attributes['checkin_at']);
    }
}