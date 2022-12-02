<?php

namespace addons\restful;

use thinkAddons;

class Restful extends Addons
{
  public function install()
  {
    return true;
  }

  public function uninstall()
  {
    return true;
  }

  public function restfulhook($param)
  {
    print_r($param);
    // 当前插件的配置信息，配置信息存在当前目录的config.php文件中，见下方
    print_r($this->getConfig());
    // 可以返回模板，模板文件默认读取的为插件目录中的文件。模板名不能为空！
    return 'hello world';
  }
}
