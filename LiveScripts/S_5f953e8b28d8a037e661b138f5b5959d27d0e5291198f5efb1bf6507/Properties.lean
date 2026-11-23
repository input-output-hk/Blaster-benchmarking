import LiveScripts.Shared
import LiveScripts.S_5f953e8b28d8a037e661b138f5b5959d27d0e5291198f5efb1bf6507.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f953e8b28d8a037e661b138f5b5959d27d0e5291198f5efb1bf6507.script [ctx] 10000]
