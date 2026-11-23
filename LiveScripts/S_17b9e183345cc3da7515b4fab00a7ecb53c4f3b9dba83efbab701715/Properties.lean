import LiveScripts.Shared
import LiveScripts.S_17b9e183345cc3da7515b4fab00a7ecb53c4f3b9dba83efbab701715.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_17b9e183345cc3da7515b4fab00a7ecb53c4f3b9dba83efbab701715.script [datum, redeemer, ctx] 10000]
