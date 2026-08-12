/** Suggested next steps for a claim based on CRM / portal status. */
export function suggestedClaimActions(status: string | null | undefined): {
  id: string
  title: string
  status: string
  due_date: string | null
  priority: string
  source: 'suggested'
}[] {
  const s = (status ?? '').toLowerCase()

  if (s.includes('settled') || s.includes('closed') || s.includes('paid')) {
    return [
      {
        id: 'suggested-review-settlement',
        title: 'Review settlement confirmation and close out documents',
        status: 'Suggested',
        due_date: null,
        priority: 'Normal',
        source: 'suggested',
      },
    ]
  }

  if (s.includes('awaiting') || s.includes('info') || s.includes('outstanding')) {
    return [
      {
        id: 'suggested-upload-info',
        title: 'Upload the information / documents requested by the broker',
        status: 'Action required',
        due_date: null,
        priority: 'High',
        source: 'suggested',
      },
      {
        id: 'suggested-confirm-contact',
        title: 'Confirm contact details for the assessor / broker',
        status: 'Suggested',
        due_date: null,
        priority: 'Normal',
        source: 'suggested',
      },
    ]
  }

  if (s.includes('assess') || s.includes('investigation') || s.includes('open')) {
    return [
      {
        id: 'suggested-await-assessor',
        title: 'Await assessor / insurer feedback',
        status: 'In progress',
        due_date: null,
        priority: 'Normal',
        source: 'suggested',
      },
      {
        id: 'suggested-repair-quote',
        title: 'Obtain / upload repair quotes and invoices when available',
        status: 'Suggested',
        due_date: null,
        priority: 'Normal',
        source: 'suggested',
      },
    ]
  }

  if (s.includes('submitted') || s.includes('new') || !s) {
    return [
      {
        id: 'suggested-broker-ack',
        title: 'Await broker acknowledgement of the claim',
        status: 'Pending',
        due_date: null,
        priority: 'Normal',
        source: 'suggested',
      },
      {
        id: 'suggested-supporting-docs',
        title: 'Ensure photos, statements and invoices are attached',
        status: 'Suggested',
        due_date: null,
        priority: 'High',
        source: 'suggested',
      },
    ]
  }

  return [
    {
      id: 'suggested-follow-up',
      title: 'Follow up with your broker on claim progress',
      status: 'Suggested',
      due_date: null,
      priority: 'Normal',
      source: 'suggested',
    },
  ]
}
