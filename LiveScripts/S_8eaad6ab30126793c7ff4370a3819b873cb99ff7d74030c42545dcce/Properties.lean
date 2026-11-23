import LiveScripts.Shared
import LiveScripts.S_8eaad6ab30126793c7ff4370a3819b873cb99ff7d74030c42545dcce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8eaad6ab30126793c7ff4370a3819b873cb99ff7d74030c42545dcce.script [ctx] 10000]
