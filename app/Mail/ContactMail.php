<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;

    public $details;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($detail)
    {
        $this->details = $detail;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $template = 'mail.mail_template';
        $subject = 'Liên hệ từ khách hàng';
        if (!empty($this->details['template'])) {
            $template = $this->details['template'];
        }
        if (!empty($this->details['subject'])) {
            $subject = $this->details['subject'];
        }
        return $this->subject($subject)
            ->view($template);
    }
}
