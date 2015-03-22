module.exports =
  url:
    mongodb:
      connectionString: process.env.MONGODB_URL
  monitor:
    name:                   'origin'
    apiUrl:                 process.env.API_URL # must be accessible without a proxy
    pollingInterval:        10000      # ten seconds
    timeout:                5000       # five seconds
    userAgent:              'NodeUptime/3.0 (https://github.com/fzaninotto/uptime)'
  analyzer:
    updateInterval:         60000      # one minute
    qosAggregationInterval: 600000     # ten minutes
    pingHistory:            8035200000 # three months
  autoStartMonitor: true

  plugins: [
    './plugins/console',
    './plugins/patternMatcher',
    './plugins/httpOptions',
    './plugins/email'
  ]

  email:
    method:      'SMTP'
    transport:         # see https://github.com/andris9/nodemailer for transport options
      service:   process.env.EMAIL_SERVICE # see https://github.com/andris9/Nodemailer/blob/master/lib/wellknown.js for well-known services
      auth:
        user:    process.env.EMAIL_USER
        pass:    process.env.EMAIL_PASSWORD
    event:
      up:        true
      down:      true
      paused:    true
      restarted: true
    message:
      from:      process.env.EMAIL_FROM
      to:        process.env.EMAIL_RECIPIENTS

  basicAuth:
    username:    process.env.BASIC_AUTH_USER
    password:    process.env.BASIC_AUTH_PASSWORD
  verbose: process.env.DEBUG || false
