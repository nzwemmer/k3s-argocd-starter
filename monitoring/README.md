# 🚀 Best-in-Class Kubernetes Monitoring Stack

This is a comprehensive, production-ready monitoring stack that provides full observability for your Kubernetes cluster. It follows industry best practices and includes all the tools that top-tier companies use for monitoring.

## 📊 What's Included

### Core Monitoring (Prometheus Stack)
- **Prometheus** - Metrics collection and storage (15 days retention)
- **Grafana** - Visualization and dashboards
- **AlertManager** - Alert routing and management
- **Node Exporter** - Hardware and OS metrics
- **Kube State Metrics** - Kubernetes object metrics
- **Prometheus Operator** - Kubernetes-native Prometheus management

### Long-term Storage (Thanos)
- **Thanos Query** - Unified querying across multiple Prometheus instances
- **Thanos Store Gateway** - Access to historical data
- **Thanos Compactor** - Data compaction and downsampling
- **Thanos Ruler** - Rule evaluation for long-term data
- **Retention**: Raw data (30 days), 5m resolution (120 days), 1h resolution (1 year)

### Log Aggregation (Loki Stack)
- **Loki** - Log aggregation and storage
- **Promtail** - Log collection agent (runs on every node)
- **Log retention**: 7 days with compression
- **Sources**: Pod logs, system logs, kernel logs, journal logs

### Distributed Tracing (Tempo)
- **Tempo** - Distributed tracing backend
- **Trace retention**: 72 hours
- **Protocols**: Jaeger, Zipkin, OTLP, OpenCensus
- **Integration**: Linked with Loki logs and Prometheus metrics

### Object Storage (MinIO)
- **MinIO** - S3-compatible object storage
- **Buckets**: Separate buckets for Thanos, Loki, and Tempo
- **Storage**: 100GB persistent storage
- **Console**: Web interface for bucket management

### Synthetic Monitoring (Blackbox Exporter)
- **Endpoint monitoring** - HTTP/HTTPS health checks
- **Service monitoring** - Internal service health
- **DNS monitoring** - DNS resolution checks
- **TCP monitoring** - Port connectivity checks

## 🌐 Access URLs

After deployment, you can access these services:

- **Grafana**: https://grafana.vanillax.xyz
  - Username: `admin`
  - Password: `prometheus-stack-admin`
- **Prometheus**: https://prometheus.vanillax.xyz
- **AlertManager**: https://alertmanager.vanillax.xyz
- **Thanos Query**: https://thanos.vanillax.xyz
- **Thanos Bucket Web**: https://thanos-bucket.vanillax.xyz
- **Loki**: https://loki.vanillax.xyz
- **Tempo**: https://tempo.vanillax.xyz
- **MinIO Console**: https://minio-console.vanillax.xyz
  - Username: `minioadmin`
  - Password: `minioadmin`

## 📈 Key Features

### Metrics (Prometheus + Thanos)
- **15 days** of high-resolution metrics in Prometheus
- **1 year** of long-term storage in Thanos
- **Automatic downsampling** for efficient storage
- **Global querying** across time ranges
- **High availability** with multiple replicas

### Logs (Loki + Promtail)
- **All pod logs** automatically collected
- **System logs** from journald
- **Kernel logs** for system debugging
- **Log parsing** and labeling
- **Integration** with Grafana for log exploration

### Traces (Tempo)
- **Multiple protocols** supported (Jaeger, Zipkin, OTLP)
- **Service maps** for dependency visualization
- **Trace-to-logs** correlation
- **Trace-to-metrics** correlation

### Dashboards
- **Cluster overview** - High-level cluster health
- **Node metrics** - Detailed node performance
- **Kubernetes resources** - Pod, deployment, service metrics
- **Application metrics** - Custom application dashboards
- **Log exploration** - Centralized log viewing
- **Trace analysis** - Distributed tracing visualization

### Alerting
- **Comprehensive alert rules** for infrastructure
- **Custom alerting** for applications
- **Multiple notification channels** (Slack, email, webhooks)
- **Alert grouping** and deduplication
- **Escalation policies**

## 🔧 Resource Requirements

### Minimum Resources
- **CPU**: 8 cores total
- **Memory**: 16GB total
- **Storage**: 300GB persistent storage

### Recommended Resources
- **CPU**: 12+ cores
- **Memory**: 24GB+
- **Storage**: 500GB+ persistent storage

## 📦 Storage Breakdown

- **Prometheus**: 50GB (metrics)
- **Thanos Store**: 50GB (historical data cache)
- **Thanos Compactor**: 100GB (compaction workspace)
- **Loki**: 20GB (logs)
- **Tempo**: 30GB (traces)
- **MinIO**: 100GB (object storage)
- **Grafana**: 10GB (dashboards and config)

## 🚀 Deployment

The stack is automatically deployed via ArgoCD. All components are configured with:

- **Persistent storage** using Longhorn
- **Resource limits** and requests
- **Security contexts** and pod security policies
- **Service monitors** for Prometheus scraping
- **Network policies** for security
- **High availability** where applicable

## 🔍 Monitoring Capabilities

### Infrastructure Monitoring
- ✅ Node CPU, memory, disk, network
- ✅ Kubernetes API server health
- ✅ etcd performance
- ✅ Container resource usage
- ✅ Persistent volume usage
- ✅ Network policies and ingress

### Application Monitoring
- ✅ HTTP endpoint health checks
- ✅ Database connection monitoring
- ✅ Custom application metrics
- ✅ Service dependency mapping
- ✅ Error rate and latency tracking

### Security Monitoring
- ✅ Failed authentication attempts
- ✅ Privilege escalation attempts
- ✅ Network policy violations
- ✅ Certificate expiration
- ✅ Vulnerability scanning results

## 🎯 Best Practices Implemented

1. **Separation of Concerns** - Each tool has a specific purpose
2. **Data Retention Policies** - Balanced storage vs. retention
3. **Resource Management** - Proper limits and requests
4. **Security** - Non-root containers, read-only filesystems
5. **High Availability** - Multiple replicas for critical components
6. **Observability** - The monitoring stack monitors itself
7. **Scalability** - Horizontal scaling capabilities
8. **Cost Optimization** - Efficient storage and compression

## 🔧 Customization

### Adding Custom Dashboards
1. Create a ConfigMap with the dashboard JSON
2. Add the label `grafana_dashboard: "1"`
3. Place it in the `dashboards/` directory

### Adding Custom Alerts
1. Create a PrometheusRule resource
2. Define your alerting rules
3. Include appropriate labels for routing

### Adding Custom Metrics
1. Expose metrics in Prometheus format
2. Create a ServiceMonitor resource
3. Configure scraping intervals and labels

## 🆘 Troubleshooting

### Common Issues
1. **High memory usage** - Adjust retention policies
2. **Storage full** - Increase PVC sizes or adjust retention
3. **Missing metrics** - Check ServiceMonitor configurations
4. **Slow queries** - Optimize PromQL queries or add more resources

### Health Checks
All components expose health endpoints that are monitored by Blackbox Exporter:
- Prometheus: `/-/healthy`
- Grafana: `/api/health`
- AlertManager: `/-/healthy`
- Loki: `/ready`
- Tempo: `/ready`
- MinIO: `/minio/health/live`

## 📚 Learning Resources

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Thanos Documentation](https://thanos.io/tip/thanos/getting-started.md/)
- [Loki Documentation](https://grafana.com/docs/loki/)
- [Tempo Documentation](https://grafana.com/docs/tempo/)

This monitoring stack provides enterprise-grade observability that scales with your infrastructure and gives you deep insights into your Kubernetes cluster and applications! 🎉 