{section show=$task_id|eq(0)}
<form action="{$module.functions.view.uri}" method="post" name="TaskList">
{section-else}
<form action="{$module.functions.view.uri}/{$task_id}" method="post" name="TaskList">
{/section}

{section show=$task_id|gt(0)}
<h1>Task view</h1>
{section-else}
<h1>Task list</h1>
{/section}

{section show=$task_id|gt(0)}
  {section show=$task.parent_task_id|gt(0)}
<a href="{$module.functions.view.uri}/{$task.parent_task_id}">Parent</a>
{section-else}
<a href="{$module.functions.view.uri}">Parent</a>
  {/section}
{/section}

<table>
{section show=$task_id|gt(0)}
<tr><td><h2>Messages</h2></td></tr>
{section name=Message loop=$task.messages max=5}
  {section show=$Message:item.contentobject_id|gt(0)}
    {let object=$Message:item.contentobject}
<tr><td>{content_view_gui view=$view_type content_object=$Message:object}</td></tr>
    {/let}
  {/section}
{/section}
</table>

{/section}

<table cellspacing="0" width="100%">
{section show=$task_id|eq(0)}
<tr><td colspan="6"><h2>Incoming</h2></td></tr>
<tr>
  <th>ID</th><th>Title</th><th>Type</th><th>Status</th><th>Creator</th><th>Created</th><th colspan="2">Modified</th>
</tr>
{section name=Incoming loop=$incoming_task_list sequence=array('bglight','bgdark')}
<tr>
  <td class="{$Incoming:sequence}"><a href="{$module.functions.view.uri}/{$Incoming:item.id}">{$Incoming:item.id}</a></td>
  <td class="{$Incoming:sequence}">
{section show=$Incoming:item.task_type|eq(1)}
{let message=$Incoming:item.first_message}
  {section show=$Incoming:message}
  {$Incoming:message.name}
  {/section}
{/let}
{section-else}
  {section show=$Incoming:item.object_id|gt(0)}
  Assigned object '{$Incoming:item.contentobject.name}'
  {/section}
{/section}
  </td>
  <td class="{$Incoming:sequence}">{$Incoming:item.task_type|choose('None','Task','Assignment')}</td>
  <td class="{$Incoming:sequence}">{$Incoming:item.status|choose('None','Temporary','Open','Closed','Cancelled')}</td>
  <td class="{$Incoming:sequence}">{$Incoming:item.creator.login}</td>
  <td class="{$Incoming:sequence}">{$Incoming:item.created|l10n('shortdatetime')}&nbsp;&nbsp;</td>
  <td class="{$Incoming:sequence}">{$Incoming:item.modified|l10n('shortdatetime')}</td>
  <td class="{$Incoming:sequence}" width="1%"><input type="checkbox" name="Task_id_checked[]" value="{$Incoming:item.id}"></td>
</tr>
{/section}
{/section}


{section show=$task_id|eq(0)}
<tr><td colspan="6"><h2>Outgoing</h2></td></tr>
{section-else}
<tr><td colspan="6"><h2>Sub tasks</h2></td></tr>
{/section}
<tr>
  <th>ID</th><th>Title</th><th>Type</th><th>Status</th><th>Receiver</th><th>Created</th><th>Modified</th>
</tr>
{section name=Outgoing loop=$outgoing_task_list sequence=array('bglight','bgdark')}
<tr>
  <td class="{$Outgoing:sequence}"><a href="{$module.functions.view.uri}/{$Outgoing:item.id}">{$Outgoing:item.id}</a></td>
  <td class="{$Outgoing:sequence}">
{section show=$Outgoing:item.task_type|eq(1)}
{let message=$Outgoing:item.first_message}
  {section show=$Outgoing:message}
  {$Outgoing:message.name}
  {/section}
{/let}
{section-else}
  {section show=$Outgoing:item.object_id|gt(0)}
  Assigned object '{$Outgoing:item.contentobject.name}'
  {/section}
{/section}
  </td>
  <td class="{$Outgoing:sequence}">{$Outgoing:item.task_type|choose('None','Task','Assignment')}</td>
  <td class="{$Outgoing:sequence}">{$Outgoing:item.status|choose('None','Temporary','Open','Closed','Cancelled')}</td>
  <td class="{$Outgoing:sequence}">{$Outgoing:item.receiver.login}</td>
  <td class="{$Outgoing:sequence}">{$Outgoing:item.created|l10n('shortdatetime')}&nbsp;&nbsp;</td>
  <td class="{$Outgoing:sequence}">{$Outgoing:item.modified|l10n('shortdatetime')}</td>
  <td class="{$Outgoing:sequence}" width="1%"><input type="checkbox" name="Task_id_checked[]" value="{$Outgoing:item.id}"></td>
</tr>
{/section}
</table>

<table width="100%">
<tr>
  <td>{include uri="design:gui/button.tpl" name=NewTask id_name=NewTaskButton value="New Task"|i18n('task')}</td>
  <td>{include uri="design:gui/button.tpl" name=NewAssignment id_name=NewAssignmentButton value="New Assignment"|i18n('task')}</td>
  <td>&nbsp;&nbsp;&nbsp;</td>
  <td>{include uri="design:gui/button.tpl" name=NewMessage id_name=NewMessageButton value="New Message"|i18n('task')}</td>
  <td>
<select name="ClassID">
{section name=Classes loop=$class_list}
<option value="{$Classes:item.id}">{$Classes:item.name}</option>
{/section}
</select>
  </td>
  <td>{include uri="design:gui/button.tpl" name=CloseTask id_name=CloseTaskButton value="Close Task"|i18n('task')}</td>
  <td>{include uri="design:gui/button.tpl" name=CancelTask id_name=CancelTaskButton value="Cancel Task"|i18n('task')}</td>
  <td width="99%"></td>
</tr>
</table>

</form>
