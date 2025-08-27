extends Node

func _ready() -> void:

	var raw_json := '''
		[
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb",
			),
			addrs: [
				/ip6/2a01:4f9:2a:1ad3::2/tcp/4001/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip4/95.216.26.170/udp/4001/quic-v1/webtransport/certhash/uEiBDdx0DCvBtjeCo5OOnY66u8NGPo0NMg_8Mx3RVk7s53A/certhash/uEiBEPC0nznQRovqI0uhS2viMJCZdmenMyBlkGmqLipus7Q/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip6/2a01:4f9:2a:1ad3::2/udp/4001/webrtc-direct/certhash/uEiDHYNr_fOyqs0RL5mp4o9qfZWVYXp1oq2gUf2scdeqyMw/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip4/95.216.26.170/udp/4001/webrtc-direct/certhash/uEiDHYNr_fOyqs0RL5mp4o9qfZWVYXp1oq2gUf2scdeqyMw/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip6/2a01:4f9:2a:1ad3::2/udp/4001/quic-v1/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,            /ip4/95.216.26.170/udp/4001/quic-v1/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip6/2a01:4f9:2a:1ad3::2/udp/4001/quic-v1/webtransport/certhash/uEiBDdx0DCvBtjeCo5OOnY66u8NGPo0NMg_8Mx3RVk7s53A/certhash/uEiBEPC0nznQRovqI0uhS2viMJCZdmenMyBlkGmqLipus7Q/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
				/ip4/95.216.26.170/tcp/4001/p2p/12D3KooWEGy1b9QLiQ4kyjk9GhF3vcWj3aQyVzfbuW7JeS1NdWhb,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ",
			),
			addrs: [
				/ip4/127.0.0.1/udp/4001/webrtc-direct/certhash/uEiAlBIDZWM2EoOaVmwWlOD_E-FniO_RW08UxTpiZRIpSOA/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip6/::1/udp/4001/webrtc-direct/certhash/uEiAlBIDZWM2EoOaVmwWlOD_E-FniO_RW08UxTpiZRIpSOA/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/udp/16423/webrtc-direct/certhash/uEiAlBIDZWM2EoOaVmwWlOD_E-FniO_RW08UxTpiZRIpSOA/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/udp/16291/quic-v1/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/udp/16291/quic-v1/webtransport/certhash/uEiAM17Jtl5v9AWbsOuGFVMd99n-0oeenR8EaTbYzy25BLw/certhash/uEiAYpjh7KlguKB9IJVMt1Ky0Dl7HruF7cwVVO3EvZbCn_A/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/dns4/76-67-36-21.k51qzi5uqu5dhc4rf9gzk677yobtweowgso869rq13a3fv4ocs81a1ijluh2r7.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiAM17Jtl5v9AWbsOuGFVMd99n-0oeenR8EaTbYzy25BLw/certhash/uEiAYpjh7KlguKB9IJVMt1Ky0Dl7HruF7cwVVO3EvZbCn_A/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/172.33.0.22/udp/4001/webrtc-direct/certhash/uEiAlBIDZWM2EoOaVmwWlOD_E-FniO_RW08UxTpiZRIpSOA/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip6/::1/tcp/4001/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/172.33.0.22/tcp/4001/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/172.33.0.22/udp/4001/quic-v1/webtransport/certhash/uEiAM17Jtl5v9AWbsOuGFVMd99n-0oeenR8EaTbYzy25BLw/certhash/uEiAYpjh7KlguKB9IJVMt1Ky0Dl7HruF7cwVVO3EvZbCn_A/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/udp/16291/webrtc-direct/certhash/uEiAlBIDZWM2EoOaVmwWlOD_E-FniO_RW08UxTpiZRIpSOA/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/172.33.0.22/udp/4001/quic-v1/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiAM17Jtl5v9AWbsOuGFVMd99n-0oeenR8EaTbYzy25BLw/certhash/uEiAYpjh7KlguKB9IJVMt1Ky0Dl7HruF7cwVVO3EvZbCn_A/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,            /ip4/76.67.36.21/udp/16423/quic-v1/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/udp/16423/quic-v1/webtransport/certhash/uEiAM17Jtl5v9AWbsOuGFVMd99n-0oeenR8EaTbYzy25BLw/certhash/uEiAYpjh7KlguKB9IJVMt1Ky0Dl7HruF7cwVVO3EvZbCn_A/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/ip4/76.67.36.21/tcp/4001/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
				/dns4/172-33-0-22.k51qzi5uqu5dhc4rf9gzk677yobtweowgso869rq13a3fv4ocs81a1ijluh2r7.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWCw6n5aQFyopzVPJ7MC61aC7gzV5m8igTME3bLS8uXSMQ,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa",
			),
			addrs: [
				/ip4/82.8.172.251/udp/17687/quic-v1/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/82.8.172.251/udp/17687/quic-v1/webtransport/certhash/uEiDWhpxtOqDL5Fd8ir7zYMiJ8b57DPtH0gzYFQaS3pfSVw/certhash/uEiBTQb-rfjjphcnZLJxTU6bI9sbWajQ26OGR23PIkdaOsQ/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/82.8.172.251/tcp/17687/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiDWhpxtOqDL5Fd8ir7zYMiJ8b57DPtH0gzYFQaS3pfSVw/certhash/uEiBTQb-rfjjphcnZLJxTU6bI9sbWajQ26OGR23PIkdaOsQ/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/192.168.0.36/tcp/4001/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/192.168.0.36/udp/4001/quic-v1/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiDWhpxtOqDL5Fd8ir7zYMiJ8b57DPtH0gzYFQaS3pfSVw/certhash/uEiBTQb-rfjjphcnZLJxTU6bI9sbWajQ26OGR23PIkdaOsQ/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,            /ip4/127.0.0.1/tcp/4001/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip4/192.168.0.36/udp/4001/quic-v1/webtransport/certhash/uEiDWhpxtOqDL5Fd8ir7zYMiJ8b57DPtH0gzYFQaS3pfSVw/certhash/uEiBTQb-rfjjphcnZLJxTU6bI9sbWajQ26OGR23PIkdaOsQ/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip6/::1/tcp/4001/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWA2vzkJnvFKQ51GkHPoUARMDW9A6sCzmdBoAJ32wpWTKa,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD",
			),
			addrs: [
				/ip4/167.172.237.6/tcp/4001/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
				/ip4/167.172.237.6/udp/4001/webrtc-direct/certhash/uEiDUw6AVCead7rrKwo_Ri6RB_7ptJnsp_g5p0S_Me4AF9A/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
				/ip4/127.0.0.1/udp/4001/webrtc-direct/certhash/uEiDUw6AVCead7rrKwo_Ri6RB_7ptJnsp_g5p0S_Me4AF9A/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
				/ip6/::1/tcp/4001/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
				/ip6/::1/udp/4001/webrtc-direct/certhash/uEiDUw6AVCead7rrKwo_Ri6RB_7ptJnsp_g5p0S_Me4AF9A/p2p/12D3KooWNGMfqL4AweJtpCAUg4kL8rKWoAdCUhx74zFpMhWMVfvD,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"QmdiNWrcUWdggoVFp6ENJwvzGiWh4jkBaZCjZCbEyHioeG",
			),
			addrs: [
				/ip4/91.108.227.134/tcp/19633/p2p/QmdiNWrcUWdggoVFp6ENJwvzGiWh4jkBaZCjZCbEyHioeG,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t",
			),
			addrs: [
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiA-lWwOgN1saGH7_qMwC7r7GSzh3Pkq0ws6pzr2DoXMeQ/certhash/uEiBHYqmmsj92cMEW4n0pWnt64qo-WO7AJXs5bjzbvb0sQA/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip6/::1/udp/4001/quic/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip6/::1/tcp/4001/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip4/158.247.210.111/udp/4001/quic-v1/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip4/158.247.210.111/udp/4001/quic/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip4/127.0.0.1/udp/4001/quic/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiA-lWwOgN1saGH7_qMwC7r7GSzh3Pkq0ws6pzr2DoXMeQ/certhash/uEiBHYqmmsj92cMEW4n0pWnt64qo-WO7AJXs5bjzbvb0sQA/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,            /ip4/158.247.210.111/tcp/4001/p2p/12D3KooWCgfAR5mtyAEHP4zRDzPNSdQ473VABV5jU4GD7yY5wX9t,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP",
			),
			addrs: [
				/ip4/195.202.184.111/udp/28646/quic/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.184.111/udp/28646/quic-v1/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.184.111/tcp/4001/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.154.204/udp/4001/quic-v1/webtransport/certhash/uEiAGlP7l_SVrfBofeT-eMPOb2_J1ezqeHbMS0su4iwcmGw/certhash/uEiDBO57ABaMFufVDi1K_JaWLeHNcnYPwUhxrAKDmrCuXnA/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.154.204/tcp/4001/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.184.111/udp/28638/quic-v1/webtransport/certhash/uEiAGlP7l_SVrfBofeT-eMPOb2_J1ezqeHbMS0su4iwcmGw/certhash/uEiDBO57ABaMFufVDi1K_JaWLeHNcnYPwUhxrAKDmrCuXnA/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.154.204/udp/4001/quic/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.184.111/udp/28646/quic-v1/webtransport/certhash/uEiAGlP7l_SVrfBofeT-eMPOb2_J1ezqeHbMS0su4iwcmGw/certhash/uEiDBO57ABaMFufVDi1K_JaWLeHNcnYPwUhxrAKDmrCuXnA/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.154.204/udp/4001/quic-v1/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
				/ip4/195.202.184.111/udp/28638/quic-v1/p2p/12D3KooWJdfiLo2MpcyewWe3SxBicW8BSpERZqRRbvEp8oToJdPP,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf",
			),
			addrs: [
				/ip4/172.33.0.22/tcp/4001/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/89.176.238.239/tcp/4001/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/172.33.0.22/udp/4001/quic-v1/webtransport/certhash/uEiDHphJ-6knw5yAXkojiOVmaypRs6y_yy3Q9yD5P5sjkfA/certhash/uEiAxuQ7iun4yYgMYe1SVxXnWBgDJMuDwXrKzOhYWZzg2Pg/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/89.176.238.239/udp/15193/quic-v1/webtransport/certhash/uEiDHphJ-6knw5yAXkojiOVmaypRs6y_yy3Q9yD5P5sjkfA/certhash/uEiAxuQ7iun4yYgMYe1SVxXnWBgDJMuDwXrKzOhYWZzg2Pg/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/89.176.238.239/udp/15193/webrtc-direct/certhash/uEiANJrncrFA8sqs5aCuLaSdk1LeyncS30YXgK1XvS4Mivw/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/172.33.0.22/udp/4001/webrtc-direct/certhash/uEiANJrncrFA8sqs5aCuLaSdk1LeyncS30YXgK1XvS4Mivw/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/172.33.0.22/udp/4001/quic-v1/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
				/ip4/89.176.238.239/udp/15193/quic-v1/p2p/12D3KooWBun6HhugnKKqitM4RQB2aMVMeZhgdf616BBR2XXuRjAf,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE",
			),
			addrs: [
				/ip4/207.210.95.74/udp/4001/quic-v1/webtransport/certhash/uEiCyMhq5UDGSQTplZTmIaZcPHyRyYDgqwX9xZezr9SPxJg/certhash/uEiAF8QQn75-DqctQepY9RQeh5zFV14ZaDlGDbr0X_upFlg/p2p/12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE,
				/ip4/207.210.95.74/tcp/57665/p2p/12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE,
				/ip4/207.210.95.74/udp/4001/webrtc-direct/certhash/uEiDabKXom2nPe1Cf7H01NWqfDFyDDeygPAZy7-TwQQ_3vg/p2p/12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE,
				/ip4/207.210.95.74/tcp/4001/p2p/12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE,
				/ip4/207.210.95.74/udp/4001/quic-v1/p2p/12D3KooWAqdjCtJRfyKfZkDRTe9SubqmNwJ3dBA3yUF9NKru1qfE,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"QmXqdn7QSpbudQvASMDY51vSdxjUhXbmjAffyEAp8QVtoY",
			),
			addrs: [
				/ip4/152.53.144.176/tcp/25489/p2p/QmXqdn7QSpbudQvASMDY51vSdxjUhXbmjAffyEAp8QVtoY,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC",
			),
			addrs: [
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/158.247.252.25/tcp/4001/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiAAl8-i-NAjaEIuB13Bh0rCU1EHOV2M0YgvL2_ZU0wV2g/certhash/uEiCp07TjWIKgRIV-58JP6tMMJaKkgFloriLGtiq-ZSqgcg/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,            /ip4/158.247.252.25/udp/4001/quic/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiAAl8-i-NAjaEIuB13Bh0rCU1EHOV2M0YgvL2_ZU0wV2g/certhash/uEiCp07TjWIKgRIV-58JP6tMMJaKkgFloriLGtiq-ZSqgcg/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip6/::1/udp/4001/quic/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/127.0.0.1/udp/4001/quic/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip6/::1/tcp/4001/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
				/ip4/158.247.252.25/udp/4001/quic-v1/p2p/12D3KooWFUju32n5hWuHQbXhekvt4vMDnYCidT5woePjs4Bb6GgC,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq",
			),
			addrs: [
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/45.76.26.191/udp/4001/quic/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiBrf7HEoAH0iZEm79Fi6n1naoloFHnJvxGhGwpA6xXsqQ/certhash/uEiBaO0mbJQK7xk81SBYgNyN46x5RiEIbd68fe0OVCD6xzA/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiBrf7HEoAH0iZEm79Fi6n1naoloFHnJvxGhGwpA6xXsqQ/certhash/uEiBaO0mbJQK7xk81SBYgNyN46x5RiEIbd68fe0OVCD6xzA/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,            /ip6/::1/udp/4001/quic/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/45.76.26.191/udp/4001/quic-v1/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/45.76.26.191/tcp/4001/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip6/::1/tcp/4001/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
				/ip4/127.0.0.1/udp/4001/quic/p2p/12D3KooWJGi1e4fpxdzfKVosjJfMgzabYHxX5z3XUtd3W6Q6Tnoq,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWQMw7dfhyw65bRCcjqqJqEMfwLyQ7Er8ZtRNhCo55fuLn",
			),
			addrs: [
				/ip4/92.205.105.240/tcp/4001/p2p/12D3KooWQMw7dfhyw65bRCcjqqJqEMfwLyQ7Er8ZtRNhCo55fuLn,
				/ip4/92.205.105.240/udp/4001/quic/p2p/12D3KooWQMw7dfhyw65bRCcjqqJqEMfwLyQ7Er8ZtRNhCo55fuLn,
				/ip4/92.205.105.240/udp/4001/quic-v1/p2p/12D3KooWQMw7dfhyw65bRCcjqqJqEMfwLyQ7Er8ZtRNhCo55fuLn,
				/ip4/92.205.105.240/udp/4001/quic-v1/webtransport/certhash/uEiAgjnVdY0MfprzMWKeBxgzkUn9Yn_9zoLYL5-4BVLh1sg/certhash/uEiDTEksLlZyN_2Nl8DR2wo4mDAOYBA7tTqiObM1IhTKOaA/p2p/12D3KooWQMw7dfhyw65bRCcjqqJqEMfwLyQ7Er8ZtRNhCo55fuLn,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7",
			),
			addrs: [
				/ip4/84.16.242.57/tcp/4001/p2p/12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7,
				/ip4/84.16.242.57/udp/4001/quic-v1/p2p/12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7,
				/ip4/84.16.242.57/udp/52599/quic-v1/p2p/12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7,
				/ip4/84.16.242.57/udp/52599/quic-v1/webtransport/certhash/uEiCOlYjXcAT9xHkbLQZwXe2oDZwtnjyzHpFiJwAX3bATSw/certhash/uEiAhIhaCJQCIq4q_LxlWUBdWCrya3S_6ovRN5yHLONfeDA/p2p/12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7,
				/ip4/84.16.242.57/udp/4001/quic-v1/webtransport/certhash/uEiCOlYjXcAT9xHkbLQZwXe2oDZwtnjyzHpFiJwAX3bATSw/certhash/uEiAhIhaCJQCIq4q_LxlWUBdWCrya3S_6ovRN5yHLONfeDA/p2p/12D3KooWDF3VafSJUtGCPXvDf2EjVs3Rtv77kXNPAMtho5DPQzg7,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWNHY7quvHwz13iPe1C9W4mDTT94jpXsamma4NKYG7HPQ4",
			),
			addrs: [
				/ip4/107.22.59.185/udp/4001/webrtc-direct/certhash/uEiC8L6u3VflxtKrRtlhIX2EioCn9qxMExlbSRHNv7MHBmw/p2p/12D3KooWNHY7quvHwz13iPe1C9W4mDTT94jpXsamma4NKYG7HPQ4,
				/ip4/107.22.59.185/tcp/4001/p2p/12D3KooWNHY7quvHwz13iPe1C9W4mDTT94jpXsamma4NKYG7HPQ4,
				/ip4/107.22.59.185/udp/4001/quic-v1/p2p/12D3KooWNHY7quvHwz13iPe1C9W4mDTT94jpXsamma4NKYG7HPQ4,
				/ip4/107.22.59.185/udp/4001/quic-v1/webtransport/certhash/uEiCDC9fxpITphG7cljkJbLQ75RKL6J2pCA27w6GSmfqasQ/certhash/uEiA0c3LE9UYQVxnhlOYm__Hl0BzZUQ2ePb4OF5vUhIjrqw/p2p/12D3KooWNHY7quvHwz13iPe1C9W4mDTT94jpXsamma4NKYG7HPQ4,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW",
			),
			addrs: [
				/ip4/176.8.193.80/tcp/60212/p2p/12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW,
				/ip4/176.8.193.80/udp/60212/quic-v1/p2p/12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW,
				/dns4/176-8-193-80.k51qzi5uqu5di8tzmdt4fnc5xpk4kg4qdi3vu9t5huacxry0p4d3ss7qrhwjxt.libp2p.direct/tcp/60212/tls/ws/p2p/12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW,
				/ip4/176.8.193.80/udp/60212/quic-v1/webtransport/certhash/uEiBpxsm_O-y4B6ydK7FOC0eVwXCCVm1dVFiMOkTtk5aNIw/certhash/uEiBgznUhJ0UhoJZeBiyABs84uEVTEc-BdiIaT4YPIS7nwA/p2p/12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW,
				/ip4/176.8.193.80/udp/60212/webrtc-direct/certhash/uEiBQhNhPhRKszoTekOaYVpo8nENKJo24C8ff1vvfnveuqg/p2p/12D3KooWFPNEBmMnGfrr3XBqedqJonQbg8Tah17aMKcVDoKusiZW,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz",
			),
			addrs: [
				/ip4/127.0.0.1/udp/4001/webrtc-direct/certhash/uEiCsZQlfMuS5w6DkkeijjEs34-FbuSEpMQlEF0rRCKmk0g/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/84.46.247.80/tcp/4001/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/172.17.0.2/udp/4001/quic-v1/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/172.17.0.2/udp/4001/quic-v1/webtransport/certhash/uEiBIheFOouKO-f4crSi-BKiXf_ddGHyFXQ3luwHSeu3pNA/certhash/uEiA9bp44n3nTbi8MN1LOUS1M4x0-JRbgOo6XDvETBcyCxg/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip6/::1/tcp/4001/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/127.0.0.1/udp/4001/quic-v1/webtransport/certhash/uEiBIheFOouKO-f4crSi-BKiXf_ddGHyFXQ3luwHSeu3pNA/certhash/uEiA9bp44n3nTbi8MN1LOUS1M4x0-JRbgOo6XDvETBcyCxg/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip6/::1/udp/4001/quic-v1/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip6/::1/udp/4001/quic-v1/webtransport/certhash/uEiBIheFOouKO-f4crSi-BKiXf_ddGHyFXQ3luwHSeu3pNA/certhash/uEiA9bp44n3nTbi8MN1LOUS1M4x0-JRbgOo6XDvETBcyCxg/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,            /ip4/172.17.0.2/tcp/4001/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/172.17.0.2/udp/4001/webrtc-direct/certhash/uEiCsZQlfMuS5w6DkkeijjEs34-FbuSEpMQlEF0rRCKmk0g/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/127.0.0.1/tcp/4001/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip4/127.0.0.1/udp/4001/quic-v1/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
				/ip6/::1/udp/4001/webrtc-direct/certhash/uEiCsZQlfMuS5w6DkkeijjEs34-FbuSEpMQlEF0rRCKmk0g/p2p/12D3KooWKiaryKTTNnUEgLoZrqVeppjb3VrZKpULb2zUEVo7GQuz,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWP9xP24cUtaNrXzEN2JPoggL5iiHCj99v8WA7tJFGJRZk",
			),
			addrs: [
				/ip4/149.248.21.154/tcp/4001/p2p/12D3KooWP9xP24cUtaNrXzEN2JPoggL5iiHCj99v8WA7tJFGJRZk,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda",
			),
			addrs: [
				/ip4/79.116.48.22/udp/4001/quic-v1/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/172.33.0.20/udp/4001/quic-v1/webtransport/certhash/uEiDQq_B4bYrg04bMsAyRSbDQjFotjoIEi3Eo_ijt3jAmUw/certhash/uEiBCgA5Ietr5avsNW8yYBSUMmTd_2xOtjz3-rJKBx8mkMQ/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/172.33.0.20/udp/4001/quic-v1/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/79.116.48.22/udp/4001/quic-v1/webtransport/certhash/uEiDQq_B4bYrg04bMsAyRSbDQjFotjoIEi3Eo_ijt3jAmUw/certhash/uEiBCgA5Ietr5avsNW8yYBSUMmTd_2xOtjz3-rJKBx8mkMQ/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/172.33.0.20/udp/4001/webrtc-direct/certhash/uEiB_6KJ-_bn734KRE0Zzfw3ZpvD1hwemyP1dcnaUzCE5OQ/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/79.116.48.22/tcp/4001/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/172.33.0.20/tcp/4001/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/ip4/79.116.48.22/udp/4001/webrtc-direct/certhash/uEiB_6KJ-_bn734KRE0Zzfw3ZpvD1hwemyP1dcnaUzCE5OQ/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/dns4/79-116-48-22.k51qzi5uqu5diqrap309i2kyinl425c6fm50cgwxd9au7wgl25ojzyokw80wz5.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
				/dns4/172-33-0-20.k51qzi5uqu5diqrap309i2kyinl425c6fm50cgwxd9au7wgl25ojzyokw80wz5.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWGjMLEm18PMUJBHjgW4wQFzNmM3idwirXeMNtmAc3Umda,
			],
		},
		PeerInfo {
			peer_id: PeerId(
				"12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni",
			),
			addrs: [
				/ip4/148.251.138.253/tcp/4001/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip6/2a01:4f8:210:42dd::2/udp/4001/webrtc-direct/certhash/uEiC257fPvhZyyzvUhJphTnK53YaZdrfo9N2EnV3k6dk0sA/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip6/2a01:4f8:210:42dd::2/udp/4001/quic-v1/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip6/2a01:4f8:210:42dd::2/tcp/4001/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/dns4/148-251-138-253.k51qzi5uqu5dlcuc18n910nyygociuk3ucy8g6unl20ac9tav6z1wbewzys9vn.libp2p.direct/tcp/4001/tls/ws/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip4/148.251.138.253/udp/4001/webrtc-direct/certhash/uEiC257fPvhZyyzvUhJphTnK53YaZdrfo9N2EnV3k6dk0sA/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip6/2a01:4f8:210:42dd::2/udp/4001/quic-v1/webtransport/certhash/uEiC39TPY_jkdtC8L2wmttgDK3QjJF2bRk9VPcMyiSVN1Eg/certhash/uEiAKYYTr9BC0pEvcZFFlTxH_qQLmnRIHIgelQfWRzpetBg/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/dns6/2a01-4f8-210-42dd--2.k51qzi5uqu5dlcuc18n910nyygociuk3ucy8g6unl20ac9tav6z1wbewzys9vn.libp2p.di            /ip4/148.251.138.253/udp/4001/quic-v1/webtransport/certhash/uEiC39TPY_jkdtC8L2wmttgDK3QjJF2bRk9VPcMyiSVN1Eg/certhash/uEiAKYYTr9BC0pEvcZFFlTxH_qQLmnRIHIgelQfWRzpetBg/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
				/ip4/148.251.138.253/udp/4001/quic-v1/p2p/12D3KooWPnfpvKQZaC32dGEV2zk8HKNwZcYFYe7HCVm9wDKZJqni,
			],
		},
]
	'''
	#var peer_array: Array = JSON.parse_string(raw_json)
	#var parsed = parse_peer_info(peer_array)
	print(parse_kademlia_output(raw_json))






func parse_kademlia_output(raw: String) -> Array:
	var peers: Array = []
	var lines := raw.split("\n", false)
	var current_peer := {}
	var in_addrs := false
	var total = 0

	for line in lines:
		line = line.strip_edges()

		# Detecta inicio de bloque PeerInfo
		if line.begins_with("PeerInfo"):
			current_peer = {}
			in_addrs = false

		# Extrae peer_id
		elif line.begins_with("peer_id: PeerId("):
			var id := line.replace("peer_id: PeerId(", "").replace("),", "").strip_edges()
			current_peer["peer_id"] = id
			total += 1

		# Inicia bloque de direcciones
		elif line.begins_with("addrs: ["):
			current_peer["addrs"] = []
			in_addrs = true

		# Procesa cada dirección dentro del bloque addrs
		elif in_addrs:
			if line == "],":
				in_addrs = false
			else:
				var addr := line.rstrip(",").strip_edges()

				# Asegura que esté entre comillas
				if not addr.begins_with("\""):
					addr = "\"" + addr
				if not addr.ends_with("\""):
					addr = addr + "\""

				# Elimina comillas para guardar como string limpio
				if addr.begins_with("\""):
					addr = addr.substr(1)
				if addr.ends_with("\""):
					addr = addr.substr(0, addr.length() - 1)

				current_peer["addrs"].append(addr)

		# Cierra bloque PeerInfo
		elif line == "},":
			if current_peer.has("peer_id") and current_peer.has("addrs"):
				peers.append(current_peer)
	prints("total peer : " , total)
	return peers
