{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='deviceClaimConfiguration', url='', help='"DeviceClaimConfiguration is used for configuration parameters in DeviceClaim."'),
  '#opaque':: d.obj(help='"OpaqueDeviceConfiguration contains configuration parameters for a driver in a format defined by the driver vendor."'),
  opaque: {
    '#withDriver':: d.fn(help='"Driver is used to determine which kubelet plugin needs to be passed these configuration parameters.\\n\\nAn admission policy provided by the driver developer could use this to decide whether it needs to validate them.\\n\\nMust be a DNS subdomain and should end with a DNS domain owned by the vendor of the driver."', args=[d.arg(name='driver', type=d.T.string)]),
    withDriver(driver): { opaque+: { driver: driver } },
    '#withParameters':: d.fn(help="\"RawExtension is used to hold extensions in external versions.\\n\\nTo use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.\\n\\n// Internal package:\\n\\n\\ttype MyAPIObject struct {\\n\\t\\truntime.TypeMeta `json:\\\",inline\\\"`\\n\\t\\tMyPlugin runtime.Object `json:\\\"myPlugin\\\"`\\n\\t}\\n\\n\\ttype PluginA struct {\\n\\t\\tAOption string `json:\\\"aOption\\\"`\\n\\t}\\n\\n// External package:\\n\\n\\ttype MyAPIObject struct {\\n\\t\\truntime.TypeMeta `json:\\\",inline\\\"`\\n\\t\\tMyPlugin runtime.RawExtension `json:\\\"myPlugin\\\"`\\n\\t}\\n\\n\\ttype PluginA struct {\\n\\t\\tAOption string `json:\\\"aOption\\\"`\\n\\t}\\n\\n// On the wire, the JSON will look something like this:\\n\\n\\t{\\n\\t\\t\\\"kind\\\":\\\"MyAPIObject\\\",\\n\\t\\t\\\"apiVersion\\\":\\\"v1\\\",\\n\\t\\t\\\"myPlugin\\\": {\\n\\t\\t\\t\\\"kind\\\":\\\"PluginA\\\",\\n\\t\\t\\t\\\"aOption\\\":\\\"foo\\\",\\n\\t\\t},\\n\\t}\\n\\nSo what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)\"", args=[d.arg(name='parameters', type=d.T.object)]),
    withParameters(parameters): { opaque+: { parameters: parameters } },
    '#withParametersMixin':: d.fn(help="\"RawExtension is used to hold extensions in external versions.\\n\\nTo use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.\\n\\n// Internal package:\\n\\n\\ttype MyAPIObject struct {\\n\\t\\truntime.TypeMeta `json:\\\",inline\\\"`\\n\\t\\tMyPlugin runtime.Object `json:\\\"myPlugin\\\"`\\n\\t}\\n\\n\\ttype PluginA struct {\\n\\t\\tAOption string `json:\\\"aOption\\\"`\\n\\t}\\n\\n// External package:\\n\\n\\ttype MyAPIObject struct {\\n\\t\\truntime.TypeMeta `json:\\\",inline\\\"`\\n\\t\\tMyPlugin runtime.RawExtension `json:\\\"myPlugin\\\"`\\n\\t}\\n\\n\\ttype PluginA struct {\\n\\t\\tAOption string `json:\\\"aOption\\\"`\\n\\t}\\n\\n// On the wire, the JSON will look something like this:\\n\\n\\t{\\n\\t\\t\\\"kind\\\":\\\"MyAPIObject\\\",\\n\\t\\t\\\"apiVersion\\\":\\\"v1\\\",\\n\\t\\t\\\"myPlugin\\\": {\\n\\t\\t\\t\\\"kind\\\":\\\"PluginA\\\",\\n\\t\\t\\t\\\"aOption\\\":\\\"foo\\\",\\n\\t\\t},\\n\\t}\\n\\nSo what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)\"\n\n**Note:** This function appends passed data to existing values", args=[d.arg(name='parameters', type=d.T.object)]),
    withParametersMixin(parameters): { opaque+: { parameters+: parameters } },
  },
  '#withRequests':: d.fn(help='"Requests lists the names of requests where the configuration applies. If empty, it applies to all requests."', args=[d.arg(name='requests', type=d.T.array)]),
  withRequests(requests): { requests: if std.isArray(v=requests) then requests else [requests] },
  '#withRequestsMixin':: d.fn(help='"Requests lists the names of requests where the configuration applies. If empty, it applies to all requests."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='requests', type=d.T.array)]),
  withRequestsMixin(requests): { requests+: if std.isArray(v=requests) then requests else [requests] },
  '#mixin': 'ignore',
  mixin: self,
}
