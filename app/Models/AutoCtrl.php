<?php

namespace App\Models;


use App\Utils\Tools;

class AutoCtrl extends Model

{
	protected $connection = "default";
    protected $table = "autoctrl";



	public function datetime()
    {
        return date("Y-m-d H:i:s",$this->attributes['datetime']);
    }
	
	public function content()
    {
        return str_replace(PHP_EOL,'<br>', $this->attributes['value']);;
		
    }

}
