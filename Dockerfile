# syntax=docker/dockerfile:1.0-experimental
# Copyright © 2022 cuisongliu@qq.com.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM alpine:latest
MAINTAINER "cuisongliu <cuisongliu@qq.com>"

ENTRYPOINT ["/usr/bin/endpoints-balance"]

ARG TARGETPLATFORM
WORKDIR /usr/bin/

RUN --mount=target=/build tar xf /build/dist/endpoints-balance_*_$(echo ${TARGETPLATFORM} | tr '/' '_' | sed -e 's/arm_/arm/').tar.gz

CMD ["--help"]