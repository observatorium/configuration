local app =
  (import 'kube-thanos.libsonnet') +
  {
    _config+:: {
      namespace: 'observability-platform',

      images+: {
        thanos: 'improbable/thanos:v0.5.0',
      },
    },
  };

{ ['thanos-querier-' + name]: app.thanos.querier[name] for name in std.objectFields(app.thanos.querier) } +
{ ['thanos-receive-' + name]: app.thanos.receive[name] for name in std.objectFields(app.thanos.receive) } +
{ ['thanos-store-' + name]: app.thanos.store[name] for name in std.objectFields(app.thanos.store) }