{*
* 2010-2023 Webkul.
*
* NOTICE OF LICENSE
*
* All right is reserved,
* Please go through this link for complete license : https://store.webkul.com/license.html
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to https://store.webkul.com/customisation-guidelines/ for more information.
*
*  @author    Webkul IN <support@webkul.com>
*  @copyright 2010-2023 Webkul IN
*  @license   https://store.webkul.com/license.html
*}

<div class="modal-body">
    <form action="" method="post" class="form-horizontal row room_status_info_form">
        <div class="col-sm-7">
            <select name="booking_order_status" class="form-control booking_order_status margin-bottom-5">
                {foreach from=$hotel_order_status item=state}
                    <option value="{$state['id_status']|intval}" {if isset($data.id_status) && $state.id_status == $data.id_status} selected="selected" disabled="disabled"{/if}>{$state.name|escape}</option>
                {/foreach}
            </select>

            {if $data['id_status'] == $hotel_order_status['STATUS_CHECKED_IN']['id_status']}
                <p class="text-center"><span class="badge badge-success margin-bottom-5">{l s='Checked in on'} {dateFormat date=$data['check_in']}</span></p>
            {elseif $data['id_status'] == $hotel_order_status['STATUS_CHECKED_OUT']['id_status']}
                <p class="text-center"><span class="badge badge-success margin-bottom-5">{l s='Checked out on'} {dateFormat date=$data['check_out']}</span></p>
            {/if}

            {* field for the current date *}
            <input class="room_status_date wk-input-date" type="text" name="status_date" value="{if $data['id_status'] == $hotel_order_status['STATUS_CHECKED_IN']['id_status']}{$data['date_to']|date_format:"%d-%m-%Y"}{else}{$data['date_from']|date_format:"%d-%m-%Y"}{/if}" readonly/>

            <input type="hidden" name="date_from" value="{$data['date_from']|date_format:"%Y-%m-%d"}" />
            <input type="hidden" name="date_to" value="{$data['date_to']|date_format:"%Y-%m-%d"}" />
            <input type="hidden" name="id_room" value="{$data['id_room']}" />
            <input type="hidden" name="id_order" value="{$order->id}" />
        </div>
        <div class="col-sm-5">
            <button type="submit" name="submitbookingOrderStatus" class="btn btn-primary">
                {l s='Update Status'}
            </button>
        </div>
    </form>
</div>
