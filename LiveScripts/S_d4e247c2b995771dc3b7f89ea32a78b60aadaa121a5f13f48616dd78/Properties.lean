import LiveScripts.Shared
import LiveScripts.S_d4e247c2b995771dc3b7f89ea32a78b60aadaa121a5f13f48616dd78.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d4e247c2b995771dc3b7f89ea32a78b60aadaa121a5f13f48616dd78.script [ctx] 10000]
