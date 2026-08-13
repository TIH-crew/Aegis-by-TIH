import { useCallback, useEffect, useRef, useState } from 'react'
import type { VapiCallerContext } from '../lib/vapi-caller-context'
import {
  VapiCallController,
  type VapiCallControllerSnapshot,
} from '../services/vapi-call.controller'
import { createEmptyCallSession } from '../types/vapi-call'

const idleSnapshot: VapiCallControllerSnapshot = {
  state: 'idle',
  speaker: 'none',
  elapsedSeconds: 0,
  errorMessage: null,
  session: createEmptyCallSession(),
  micDenied: false,
}

export function useVapiCall() {
  const controllerRef = useRef<VapiCallController | null>(null)
  const [snapshot, setSnapshot] = useState<VapiCallControllerSnapshot>(idleSnapshot)

  useEffect(() => {
    const controller = new VapiCallController()
    controllerRef.current = controller
    const unsubscribe = controller.subscribe(setSnapshot)
    return () => {
      unsubscribe()
      void controller.dispose()
      controllerRef.current = null
    }
  }, [])

  const startCall = useCallback(async (callerContext?: VapiCallerContext) => {
    await controllerRef.current?.startCall(callerContext)
  }, [])

  const endCall = useCallback(async () => {
    await controllerRef.current?.endCall()
  }, [])

  const resetToIdle = useCallback(() => {
    controllerRef.current?.resetToIdle()
  }, [])

  const getSessionRecord = useCallback(() => {
    return controllerRef.current?.getSessionRecord() ?? createEmptyCallSession()
  }, [])

  return {
    ...snapshot,
    startCall,
    endCall,
    resetToIdle,
    getSessionRecord,
    canStart: snapshot.state === 'idle' || snapshot.state === 'ended' || snapshot.state === 'error',
    isBusy:
      snapshot.state === 'connecting' ||
      snapshot.state === 'active' ||
      snapshot.state === 'ending',
  }
}
