<?php

namespace SF {

//------------------------------------------------------------------------------
//! Class for form.
//------------------------------------------------------------------------------
class Form
{
    private $buff      = "";
    private $finalized = false;
    private $bootstrap = true;

    //--------------------------------------------------------------------------
    //! constructs class
    //!
    //! @param      <type>   $legend     The legend
    //! @param      string   $action     The action
    //! @param      string   $method     The method
    //! @param      string   $class      The class
    //! @param      string   $id         The identifier
    //! @param      boolean  $bootstrap  The bootstrap
    //--------------------------------------------------------------------------
    function __construct($legend, $action, $method = "post", $class = "", $id = "", $bootstrap = true)
    {
        $this->header($legend, $action, $method, $class, $id, $bootstrap);
    }

    //--------------------------------------------------------------------------
    //! create form header / reset content
    //!
    //! @param      string  $legend  The legend
    //! @param      string  $action  The action
    //! @param      string  $method  The method
    //! @param      string  $class   The class
    //! @param      string  $id      The identifier
    //--------------------------------------------------------------------------
    function header($legend, $action, $method = "post", $class = "", $id = "", $bootstrap = true)
    {
        $this->finalized = false;
        $this->bootstrap = $bootstrap;

        $this->buff = "<form action='".$action."' method='".$method."' enctype='multipart/form-data'";

        if ($class != "")
        {
            $this->buff .= " class='".$class."'";
        }

        if ($id != "")
        {
            $this->buff .= " id='".$id."'";
        }

        $this->buff .= ">\n<fieldset>\n<legend>".$legend."</legend>\n";
    }

    //--------------------------------------------------------------------------
    //! create an input field
    //!
    //! @param      string  $type          text, password or hidden
    //! @param      string  $descr         The description
    //! @param      string  $name          The name
    //! @param      string  $value         The value
    //! @param      bool    $linebreak     if true make line break
    //! @param      string  $id            The identifier
    //! @param      bool    $labelinfront  place label in front or behind
    //! @param      string  $attrs         any extra tag
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    protected function input($type, $descr, $name, $value, $linebreak, $id = "", $labelinfront = true, $attrs = "")
    {
        if (!$this->finalized)
        {
            if ($id == "")
            {
                $id = $name;
            }

            if ($labelinfront)
            {
                if (($descr != "") && ($name != ""))
                {
                    $this->buff .= "<label for='".$id."'>".$descr."</label>\n";
                }
            }

            $this->buff .= "<input type='".$type."'";

            if ($name != "")
            {
                $this->buff .= " name='".$name."' id='".$id."'";
            }

            if ($value != "")
            {
                $this->buff .= " value='".$value."'";
            }

            if ($attrs != "")
            {
                $this->buff .= " ".$attrs;
            }

            $this->buff .= " />\n";

            if (!$labelinfront)
            {
                if (($descr != "") && ($name != ""))
                {
                    $this->buff .= "<label for='".$id."'>".$descr."</label>\n";
                }
            }

            if ($linebreak)
            {
                $this->buff .= "<br />\n";
            }
        }

        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! create text input
    //!
    //! @param      string   $descr      The description e.g. "Name:"
    //! @param      string   $name       The name
    //! @param      string   $value      The valau
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    function text($descr, $name, $value = "", $linebreak = false)
    {
        return $this->input("text", $descr, $name, $value, $linebreak);
    }

    //--------------------------------------------------------------------------
    //! create file input
    //!
    //! @param      string   $descr      The description e.g. "Name:"
    //! @param      string   $name       The name
    //! @param      integer  $maxsize    The maxsize
    //! @param      string   $accept     The accept type
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool     false on error
    //--------------------------------------------------------------------------
    function file($descr, $name, $maxsize = 512000, $accept = "text/*", $linebreak = false)
    {
        $this->hidden("MAX_FILE_SIZE", $maxsize);
        $this->input("file", $descr, $name, "", $linebreak, "", true, "accept='".$accept."'");
        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! create password input
    //!
    //! @param      string   $descr      The description e.g. "Name:"
    //! @param      string   $name       The name
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    function password($descr, $name, $linebreak = false)
    {
        return $this->input("password", $descr, $name, "", $linebreak);
    }

    //--------------------------------------------------------------------------
    //! create hidden input
    //!
    //! @param      string   $name       The name
    //! @param      string   $value      The value
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    function hidden($name, $value)
    {
        return $this->input("hidden", "", $name, $value, false);
    }

    //--------------------------------------------------------------------------
    //! create submit button
    //!
    //! @param      string   $name       text on button
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    function submit($name = "Submit", $linebreak = false)
    {
        return $this->input("submit", "", "", $name, $linebreak);
    }

    //--------------------------------------------------------------------------
    //! create reset button
    //!
    //! @param      string   $name       text on button
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool    false on error
    //--------------------------------------------------------------------------
    function reset($name = "Reset", $linebreak = false)
    {
        return $this->input("reset", "", "", $name, $linebreak);
    }

    //--------------------------------------------------------------------------
    //! create select form element
    //!
    //! @param      string   $descr      The description
    //! @param      string   $name       The name
    //! @param      array    $values     values
    //! @param      mixed    $selected   The selected
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool     false on error
    //--------------------------------------------------------------------------
    function select($descr, $name, array $values, $selected = "", $linebreak = false)
    {
        if (!$this->finalized)
        {
            $this->buff .= "<label for='".$name."'>".$descr."</label>\n"
                    ."<select name='".$name."' id='".$name."'>\n";

            if (Form::isAssoc($values))
            {
                foreach ($values as $key => $value)
                {
                    $this->buff .= "<option value='".$key."'";
                    if ($selected == $key)
                    {
                        $this->buff .= " selected='selected'";
                    }
                    $this->buff .= ">".$value."</option>\n";
                }
            }
            else
            {
                for ($i = 0; $i < count($values); $i++)
                {
                    $this->buff .= "<option value='".$values[$i]."'";
                    if ($values[$i] == $key)
                    {
                        $this->buff .= " selected='selected'";
                    }
                    $this->buff .= ">".$values[$i]."</option>\n";
                }
            }
            $this->buff .= "</select>\n";

            if ($linebreak)
            {
                $this->buff .= "<br />\n";
            }
        }

        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! create a set of radio buttons
    //!
    //! @param      string   $descr      The description
    //! @param      string   $name       The name
    //! @param      array    $values     The values
    //! @param      <type>   $selected   The selected value
    //! @param      boolean  $linebreak  The linebreak
    //!
    //! @return     bool     false on error
    //--------------------------------------------------------------------------
    function radio($descr, $name, array $values, $selected = "", $linebreak = false)
    {
        if (!$this->finalized)
        {
            if ($descr != "")
            {
                $this->buff .= "<p>".$descr."</p>\n";
            }

            $selflag = "";

            if (Form::isAssoc($values))
            {
                $i = 0;
                foreach ($values as $key => $value)
                {
                    if ($key == $selected)
                    {
                        $selflag = "checked='checked'";
                    }
                    else
                    {
                        $selflag = "";
                    }

                    $this->input("radio", $value, $name, $key, $linebreak, $name."_".$i++, false, $selflag);
                }
            }
            else
            {
                for ($i = 0; $i < count($values); $i++)
                {
                    if ($values[$i] == $selected)
                    {
                        $selflag = "checked='checked'";
                    }
                    else
                    {
                        $selflag = "";
                    }

                    $this->input("radio", $values[$i], $name, $values[$i], $linebreak, $name."_".$i, false, $selflag);
                }
            }
        }

        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! create password input
    //!
    //! @param      string   $descr      The description e.g. "Name:"
    //! @param      string   $name       The name
    //! @param      array    $values     The values
    //! @param      array    $checked    The checked
    //! @param      boolean  $linebreak  true if you want a line break
    //!
    //! @return     bool     false on error
    //--------------------------------------------------------------------------
    function check($descr, $name, array $values, array $checked = array(), $linebreak = false)
    {
        if (!$this->finalized)
        {
            if ($descr != "")
            {
                $this->buff .= "<p>".$descr."</p>\n";
            }

            $chkflag = "";

            if (Form::isAssoc($values))
            {
                $i = 0;
                foreach ($values as $key => $value)
                {
                    if (in_array($key, $checked))
                    {
                        $chkflag = "checked='checked'";
                    }
                    else
                    {
                        $chkflag = "";
                    }

                    $this->input("checkbox", $value, $name."[]", $key, $linebreak, $name."_".$i++, false, $chkflag);
                }
            }
            else
            {
                for ($i = 0; $i < count($values); $i++)
                {
                    if (in_array($values[$i], $checked))
                    {
                        $chkflag = "checked='checked'";
                    }
                    else
                    {
                        $chkflag = "";
                    }

                    $this->input("checkbox", $values[$i], $name."[]", $values[$i], $linebreak, $name."_".$i, false, $chkflag);
                }
            }
        }

        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! create a text area
    //!
    //! @param      string          $descr  The description
    //! @param      string          $name   The name
    //! @param      string          $value  The value
    //! @param      integer|string  $rows   The rows
    //! @param      integer|string  $cols   The cols
    //!
    //! @return     false on error
    //--------------------------------------------------------------------------
    function textarea($descr, $name, $value = "", $linebreak = false, $rows = 5, $cols = 40)
    {
        if (!$this->finalized)
        {
            $this->buff .= "<p>".$descr."</p>\n"
                          ."<textarea name='".$name."' cols='".$cols."' rows='".$rows."'>\n"
                          .$value."\n"
                          ."</textarea>\n";
            if ($linebreak)
            {
                $this->buff .= "<br />\n";
            }
        }

        return !$this->finalized;
    }

    //--------------------------------------------------------------------------
    //! render form
    //--------------------------------------------------------------------------
    function render()
    {
        if (!$this->finalized)
        {
            $this->buff .= "</fieldset>\n</form>\n";
            $this->finalized = true;
        }

        echo $this->buff;
    }

    //--------------------------------------------------------------------------
    //! Determines if associated array
    //!
    //! @param      array    $arr    The array
    //!
    //! @return     boolean  True if associated, False otherwise.
    //--------------------------------------------------------------------------
    static function isAssoc(array $arr)
    {
        if (array() === $arr)
        {
            return false;
        }

        return array_keys($arr) !== range(0, count($arr) - 1);
    }
}

} // ~namespace
?>
