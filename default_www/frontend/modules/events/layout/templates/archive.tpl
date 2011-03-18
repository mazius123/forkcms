{*
	variables that are available:
	- {$items}: contains an array with all posts, each element contains data about the post
*}

{option:!items}
	<div id="eventsIndex">
		<div class="mod">
			<div class="inner">
				<div class="bd">
					<p>{$msgEventsNoItems}</p>
				</div>
			</div>
		</div>
	</div>
{/option:!items}
{option:items}
	<div id="eventsIndex">
		{iteration:items}
			<div class="mod article">
				<div class="inner">
					<div class="hd">
						<h2>
							<a href="{$items.full_url}" title="{$items.title}">
								{$items.starts_on|date:{$dateFormatShort}:{$LANGUAGE}|ucfirst} -
								{$items.title}
							</a>
						</h2>
						<p>
							{option:!items.comments}<a href="{$items.full_url}#{$actComment}">{$msgEventsNoComments|ucfirst}</a>{/option:!items.comments}
							{option:items.comments}
								{option:items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$msgEventsNumberOfComments|sprintf:{$items.comments_count}}</a>{/option:items.comments_multiple}
								{option:!items.comments_multiple}<a href="{$items.full_url}#{$actComments}">{$msgEventsOneComment}</a>{/option:!items.comments_multiple}
							{/option:items.comments}
						</p>
					</div>
					<div class="bd content">
						{option:!items.introduction}{$items.text}{/option:!items.introduction}
						{option:items.introduction}{$items.introduction}{/option:items.introduction}
					</div>
					<div class="ft">
						<p>
							{$msgWrittenBy|ucfirst|sprintf:{$items.user_id|usersetting:'nickname'}}
							{$lblInTheCategory}: <a href="{$items.category_full_url}" title="{$items.category_name}">{$items.category_name}</a>.
							{option:items.tags}
								{$lblTags|ucfirst}:
								{iteration:items.tags}
									<a href="{$items.tags.full_url}" rel="tag" title="{$items.tags.name}">{$items.tags.name}</a>{option:!items.tags.last}, {/option:!items.tags.last}{option:items.tags.last}.{/option:items.tags.last}
								{/iteration:items.tags}
							{/option:items.tags}
						</p>
					</div>
				</div>
			</div>
		{/iteration:items}
	</div>
	{include:{$FRONTEND_CORE_PATH}/layout/templates/pagination.tpl}
{/option:items}