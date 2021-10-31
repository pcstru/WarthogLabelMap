# --------------------------------------------------------------------------
# Notes : Parse out associated thrustmaster values from elite dangerous binds 
# files. Hey, I just wanted a list of what was bound to what that involved the
# controller.
# --------------------------------------------------------------------------

# You will need to point this to your Bindings file. 
$user="<WHO ARE YOU>"

# This path then MAY or may not be correct!
$file = "C:\Users\$user\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings\Custom.3.0.binds"


$fin = Get-Content -Path $file
[xml]$xml = $fin

function trv_up () {

    # Recurse back up a tree, to the root and spit out the heirarchy for the leaf
    Param(
        $node , 
        [Int32]$depth
    )

    if( $node.ParentNode ) {
        $result = trv_up -node $node.ParentNode -depth ($depth+1)
        $result += ", "
    }

    $result + $node.name 
}

function list_nodes {

    param (
        $node
    )

    # look for Thrustmaster set as the value of an attribute
    if ( $node.Attributes ) {
        $istm=$false 
        $out_line=""
        foreach( $att in $node.Attributes) {
            if( $att.value -match 'ThrustMasterWarthog' ) {
                $depth = 1
                $s=trv_up -node $node.ParentNode -depth $depth
                $istm=$true
            }
        }
        # If we did find our string, we want to know the other attributes (key)
        if($istm) {
            foreach( $att in $node.Attributes) {
                $out_line += ", "+$att.value
            }
            write-host $s $out_line
        }
    }

    # Spookily Recurse children of this node
    if ( $node.HasChildNodes ) {
        foreach($child in $node.ChildNodes) {
            list_nodes($child)
        }    
    }

}

list_nodes($xml.ChildNodes)
