<?php
//
// Definition of eZWordtoimageoperator class
//
// Created on: <27-Mar-2003 13:43:10 oh>
//
// Copyright (C) 1999-2003 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE.GPL included in
// the packaging of this file.
//
// Licencees holding valid "eZ publish professional licences" may use this
// file in accordance with the "eZ publish professional licence" Agreement
// provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" is available at
// http://ez.no/home/licences/professional/. For pricing of this licence
// please contact us via e-mail to licence@ez.no. Further contact
// information is available at http://ez.no/home/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

/*! \file ezwordtoimageoperator.php
*/

/*!
  \class eZWordtoimageoperator ezwordtoimageoperator.php
  \brief The class eZWordtoimageoperator does

*/
class eZWordToImageOperator
{
    /*!
     Initializes the object with the name $name, default is "wash".
    */
    function eZWordToImageOperator( $name = "wordtoimage" )
    {
	$this->Operators = array( $name );
    }

    /*!
Returns the template operators.
    */
    function &operatorList()
    {
	return $this->Operators;
    }

    function modify( &$tpl, &$operatorName, &$operatorParameters, &$rootNamespace, &$currentNamespace, &$operatorValue, &$namedParameters )
    {
        include_once( "lib/ezutils/classes/ezini.php" );
        $ini =& eZINI::instance("wordtoimage.ini");
        $iconRoot = $ini->variable( 'WordToImageSettings', 'IconRoot' );

        $replaceText = $ini->variable( 'WordToImageSettings', 'ReplaceText' );
        $replaceIcon = $ini->variable( 'WordToImageSettings', 'ReplaceIcon' );

        foreach( $replaceIcon as $icon )
        {
            $icons[] = '<img src="' . $iconRoot .'/' . $icon . '"/>';
        }

        $operatorValue = str_replace( $replaceText, $icons, $operatorValue );
    }
    var $Operators;
}
?>
