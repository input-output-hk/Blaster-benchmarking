import LiveScripts.Shared
import LiveScripts.S_8c027908260ebc29410ce4fffe788da510e4d7fd67f4b39d3c77db5e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c027908260ebc29410ce4fffe788da510e4d7fd67f4b39d3c77db5e.script [ctx] 10000]
