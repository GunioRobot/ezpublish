<h3>{$result_number}. {"PHP safe mode is enabled"|i18n("design/standard/setup/tests")}</h3>

<p>
 {"eZ publish may work with safe mode on, however there might be several features that will be unavailable. Some of the things that might occur are:"|i18n("design/standard/setup/tests")}
</p>
<ul>
 <li>Not possible to extend time limits
  <ul>
   <li>Some parts of eZ publish relies on cronjobs to handle workflows etc., and may require a longer time to run than normal page loads. With this on the cronjob scripts will not succeed.</li>
  </ul>
 </li>
 <li>Wrong permissions
  <ul>
   <li>If the site is not setup correctly eZ publish will not be able to work with files correctly, this could mean file uploads, image handling and cache creation. Safe mode requires that the same owner is set on the index.php script and all other files for the site.</li>
  </ul>
 </li>
 <li>File uploading
  <ul>
   <li>Uploading files trough the web will not possible unless configured correctly. This means that images, files and media will not be possible to use.</li>
  </ul>
 </li>
</ul>
<p>
 {"It's recommended that the option is turned off. To turn it off edit your %1 configuration and set %2 to %3."|i18n("design/standard/setup/tests",,array("<i>php.ini</i>","<i>safe_mode</i>","<i>Off</i>"))}
 {"More information on the subject can be found at %1."|i18n("design/standard/setup/tests",,array('<a href="http://www.php.net/manual/en/features.safe-mode.php">php.net</a>'))}
</p>
<label>{"php.ini example:"|i18n("design/standard/setup/tests")}</label><br/>
<pre class="example">
safe_mode = 0
</pre>
<p>If you're not able to turn safe mode off you should try to fix the following issues.</p>
<h3>Permissions</h3>
<p>To make sure that all files have the correct user and group owner run the following commands.</p>
<pre class="example">cd {$test_result[2].current_path}
chown nouser.nouser *.php
chown -R nouser.nouser cronjobs design doc lib settings update kernel sdk share var</pre>
<p>Alternatively you may run</p>
<pre class="example">cd {$test_result[2].current_path}
chown nouser.nouser -R *</pre>
<p>If you only have access to the site using ftp you will have to consult your ftp client and server to see if it is possible to run the chown command.</p>
<blockquote class="note">
<p>
 <b>Note:</b> The <tt>nouser.nouser</tt> must be changed to your webserver username and groupname.
</p>
</blockquote>
